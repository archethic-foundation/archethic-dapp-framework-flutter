import 'dart:async';
import 'dart:developer' as dev;

import 'package:archethic_dapp_framework_flutter/src/domain/models/failures.dart';
import 'package:archethic_dapp_framework_flutter/src/util/custom_logs.dart';
import 'package:archethic_dapp_framework_flutter/src/util/generic/get_it_instance.dart';
import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:archethic_wallet_client/archethic_wallet_client.dart' as awc;
import 'package:flutter/foundation.dart';

mixin TransactionMixin {
  Future<double> calculateFees(
    Transaction transaction,
    ApiService apiService, {
    double slippage = 1.01,
  }) async {
    final transactionFee = await apiService.getTransactionFee(transaction);
    final fees = fromBigInt(transactionFee.fee) * slippage;
    return fees;
  }

  Future<void> sendTransactions(
    List<Transaction> transactions,
    ApiService apiService,
  ) async {
    var errorDetail = '';
    for (final transaction in transactions) {
      if (errorDetail.isNotEmpty) {
        break;
      }
      var next = false;
      final transactionRepository = ArchethicTransactionSender(
        apiService: apiService,
      );
      try {
        await transactionRepository.send(
          transaction: transaction,
          onConfirmation: (confirmation) async {
            if (confirmation.isEnoughConfirmed) {
              if (kDebugMode) {
                sl.get<LogManager>().log(
                      'nbConfirmations: ${confirmation.nbConfirmations}, transactionAddress: ${confirmation.transactionAddress}, maxConfirmations: ${confirmation.maxConfirmations}',
                      level: LogLevel.debug,
                      name: 'TransactionDexMixin - sendTransactions',
                    );
              }
              transactionRepository.close();
              next = true;
            }
          },
        );
      } catch (transactionError) {
        errorDetail = transactionError.toString();
      }

      while (next == false && errorDetail.isEmpty) {
        await Future.delayed(const Duration(seconds: 1));
        if (kDebugMode) dev.log('wait...');
      }
    }

    if (errorDetail.isNotEmpty) {
      throw Exception(errorDetail);
    }
  }

  Future<List<Transaction>> signTx(
    awc.ArchethicDAppClient dappClient,
    String serviceName,
    String pathSuffix,
    List<Transaction> transactions, {
    Map<String, dynamic>? description,
  }) async {
    final newTransactions = <Transaction>[];

    final payload = awc.SignTransactionRequest(
      serviceName: serviceName,
      pathSuffix: pathSuffix,
      description: description ?? {},
      transactions: transactions
          .map(
            (Transaction x) => awc.SignTransactionRequestData(
              data: x.data!,
              type: x.type!,
              version: x.version,
            ),
          )
          .toList(),
    );

    final result = await dappClient.signTransactions(payload);
    result.when(
      failure: (failure) {
        if (failure.code == 4001) {
          throw const Failure.userRejected();
        }
        throw Failure.other(
          cause: failure.message,
        );
      },
      success: (result) {
        for (var i = 0; i < transactions.length; i++) {
          newTransactions.add(
            transactions[i]
                .setAddress(Address(address: result.signedTxs[i].address))
                .setPreviousSignatureAndPreviousPublicKey(
                  result.signedTxs[i].previousSignature,
                  result.signedTxs[i].previousPublicKey,
                )
                .setOriginSignature(result.signedTxs[i].originSignature),
          );
        }
      },
    );
    return newTransactions;
  }

  Future<bool> waitForManualTxConfirmation(
    String txChainAddress,
    int targetIndex,
    ApiService apiService, {
    int nbTrials = 60,
  }) async {
    for (var i = 0; i < nbTrials; i++) {
      final txIndexMap = await apiService.getTransactionIndex([txChainAddress]);
      if (txIndexMap[txChainAddress] != null &&
          txIndexMap[txChainAddress] == targetIndex) {
        return true;
      }

      await Future.delayed(const Duration(seconds: 1));
    }

    return false;
  }

  Future<String> getCurrentAccount(
    awc.ArchethicDAppClient dappClient,
  ) async {
    var accountName = '';

    // TODO(a): remove the try catch, not mandatory but I added it to have the connection issue front exception for the user
    try {
      final result = await dappClient.getCurrentAccount().valueOrThrow;
      accountName = result.shortName;
    } catch (e, stackTrace) {
      sl.get<LogManager>().log(
            '$e',
            stackTrace: stackTrace,
            level: LogLevel.error,
            name: 'TransactionDexMixin - getCurrentAccount',
          );
    }

    return accountName;
  }

  Future<void> refreshCurrentAccountInfoWallet(
    awc.ArchethicDAppClient dappClient,
  ) async {
    try {
      await dappClient.refreshCurrentAccount();
    } catch (e) {
      // No need to notify error
    }

    return;
  }

  Future<bool> isSCCallExecuted(
    ApiService apiService,
    String contractAddress,
    String txAddress,
  ) async {
    var executed = false;

    final transactionChainResult = await apiService.getTransactionChain(
      {contractAddress: ''},
      orderAsc: false,
      request:
          'validationStamp {ledgerOperations { consumedInputs { from, type } } }',
    );

    if (transactionChainResult[contractAddress] != null) {
      final transactions = transactionChainResult[contractAddress];
      for (final transaction in transactions!) {
        if (transaction.validationStamp != null &&
            transaction.validationStamp!.ledgerOperations != null &&
            transaction
                .validationStamp!.ledgerOperations!.consumedInputs.isNotEmpty) {
          for (final consumedInput in transaction
              .validationStamp!.ledgerOperations!.consumedInputs) {
            if (consumedInput.type == 'call' &&
                consumedInput.from != null &&
                consumedInput.from!.toUpperCase() == txAddress.toUpperCase()) {
              executed = true;
              break;
            }
          }
        }
        if (executed) {
          break;
        }
      }
    }
    return executed;
  }

  Future<double> getAmountFromTxInput(
    String txAddress,
    String? tokenAddress,
    ApiService apiService,
  ) async {
    final transactionMap = await apiService.getTransaction([txAddress]);
    if (transactionMap[txAddress] == null) {
      return 0.0;
    }

    final transactionInputs = [...transactionMap[txAddress]!.inputs];
    if (transactionInputs.isEmpty) {
      return 0.0;
    }
    // ignore: cascade_invocations

    transactionInputs.sort((a, b) => b.timestamp!.compareTo(a.timestamp!));
    var amount = 0;
    for (final txInput in transactionInputs) {
      if ((tokenAddress == null || tokenAddress == 'UCO') &&
          txInput.type == 'UCO' &&
          txInput.timestamp! >
              transactionMap[txAddress]!.validationStamp!.timestamp!) {
        amount = txInput.amount!;
        break;
      } else {
        if (tokenAddress != null &&
            txInput.type == 'token' &&
            txInput.tokenAddress != null &&
            txInput.tokenAddress!.toUpperCase() == tokenAddress.toUpperCase() &&
            txInput.timestamp! >
                transactionMap[txAddress]!.validationStamp!.timestamp!) {
          amount = txInput.amount!;
          break;
        }
      }
    }

    return fromBigInt(amount).toDouble();
  }

  Future<double> getAmountFromTx(
    ApiService apiService,
    String txAddress,
    bool isUCO,
    String to, {
    bool withLastAddress = false,
  }) async {
    final genesisTo = await apiService.getGenesisAddress(to);

    var transactionMap = <String, Transaction>{};
    var amount = 0.0;
    if (isUCO) {
      if (withLastAddress) {
        transactionMap = await apiService.getLastTransaction(
          [txAddress],
          request: ' data {ledger {uco { transfers { amount, to } } } }',
        );
      } else {
        transactionMap = await apiService.getTransaction(
          [txAddress],
          request: ' data {ledger {uco { transfers { amount, to } } } }',
        );
      }

      final transfers = transactionMap[txAddress]?.data?.ledger?.uco?.transfers;
      if (transfers == null ||
          transfers.isEmpty ||
          transfers.first.amount == null) {
        return amount;
      }

      for (final transfer in transfers) {
        if (transfer.to!.toUpperCase() == genesisTo.address!.toUpperCase()) {
          amount = fromBigInt(transfer.amount).toDouble();
          break;
        }
      }
      return amount;
    } else {
      if (withLastAddress) {
        transactionMap = await apiService.getLastTransaction(
          [txAddress],
          request: ' data {ledger {token { transfers { amount, to } } } }',
        );
      } else {
        transactionMap = await apiService.getTransaction(
          [txAddress],
          request: ' data {ledger {token { transfers { amount, to } } } }',
        );
      }

      final transfers =
          transactionMap[txAddress]?.data?.ledger?.token?.transfers;
      if (transfers == null ||
          transfers.isEmpty ||
          transfers.first.amount == null) {
        return amount;
      }
      for (final transfer in transfers) {
        if (transfer.to!.toUpperCase() == genesisTo.address!.toUpperCase()) {
          amount = fromBigInt(transfer.amount).toDouble();
          break;
        }
      }
      return amount;
    }
  }
}
