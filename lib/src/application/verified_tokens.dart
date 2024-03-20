import 'dart:convert';
import 'dart:developer';

import 'package:archethic_dapp_framework_flutter/src/domain/models/verified_tokens.dart';
import 'package:archethic_dapp_framework_flutter/src/infrastructure/verified_tokens.repository.dart';
import 'package:archethic_dapp_framework_flutter/src/util/endpoint_util.dart';
import 'package:archethic_dapp_framework_flutter/src/util/generic/get_it_instance.dart';
import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verified_tokens.g.dart';

@Riverpod(keepAlive: true)
class _VerifiedTokensNotifier
    extends Notifier<({String network, List<String> verifiedTokensList})> {
  @override
  ({String network, List<String> verifiedTokensList}) build() {
    return (network: '', verifiedTokensList: <String>[]);
  }

  Future<void> init() async {
    await _getValue();
  }

  Future<void> _getValue() async {
    final network = EndpointUtil.getEnvironnement();
    final verifiedTokensFromNetwork = await ref
        .watch(_verifiedTokensRepositoryProvider)
        .getVerifiedTokensFromNetwork(network);
    log('Verified tokens list ($network) $verifiedTokensFromNetwork');
    state = (network: network, verifiedTokensList: verifiedTokensFromNetwork);
  }
}

@Riverpod(keepAlive: true)
VerifiedTokensRepository _verifiedTokensRepository(
  _VerifiedTokensRepositoryRef ref,
) =>
    VerifiedTokensRepository();

@Riverpod(keepAlive: true)
Future<VerifiedTokens> _getVerifiedTokens(
  _GetVerifiedTokensRef ref,
) async {
  final verifiedTokens =
      await ref.watch(_verifiedTokensRepositoryProvider).getVerifiedTokens();
  return verifiedTokens;
}

@Riverpod(keepAlive: true)
Future<List<String>> _getVerifiedTokensFromNetwork(
  _GetVerifiedTokensFromNetworkRef ref,
  String network,
) async {
  final verifiedTokensFromNetwork = await ref
      .read(_verifiedTokensRepositoryProvider)
      .getVerifiedTokensFromNetwork(network);
  return verifiedTokensFromNetwork;
}

@Riverpod(keepAlive: true)
Future<bool> _isVerifiedToken(
  _IsVerifiedTokenRef ref,
  String address,
) async {
  final verifiedTokens = ref.watch(_verifiedTokensNotifierProvider);
  log('verifiedTokens $verifiedTokens');
  if (verifiedTokens.verifiedTokensList.contains(address.toUpperCase())) {
    return true;
  }
  return false;
}

class VerifiedTokensRepository {
  Future<VerifiedTokens> getVerifiedTokens() async {
    return VerifiedTokensRepositoryImpl().getVerifiedTokens();
  }

  Future<List<String>> getVerifiedTokensFromNetwork(
    String network,
  ) async {
    final verifiedTokens = await getVerifiedTokens();
    switch (network) {
      case 'testnet':
        return _getVerifiedTokensFromBlockchain(
          '0000b01e7a497f0576a004c5957d14956e165a6f301d76cda35ba49be4444dac00eb',
        );
      case 'mainnet':
        return _getVerifiedTokensFromBlockchain(
          '000030ed4ed79a05cfaa90b803c0ba933307de9923064651975b59047df3aaf223bb',
        );
      default:
        return verifiedTokens.devnet;
    }
  }

  Future<List<String>> _getVerifiedTokensFromBlockchain(
    String txAddress,
  ) async {
    final lastAddressMap = await sl
        .get<ApiService>()
        .getLastTransaction([txAddress], request: 'data { content }');
    if (lastAddressMap[txAddress] != null &&
        lastAddressMap[txAddress]!.data != null &&
        lastAddressMap[txAddress]!.data!.content != null) {
      final Map<String, dynamic> jsonMap =
          jsonDecode(lastAddressMap[txAddress]!.data!.content!);
      if (jsonMap['verifiedTokens'] != null &&
          jsonMap['verifiedTokens']['tokens'] != null) {
        log('Verified tokens ${jsonMap['verifiedTokens']['tokens']}');
        return List.from(jsonMap['verifiedTokens']['tokens']);
      }
    }
    return <String>[];
  }
}

abstract class VerifiedTokensProviders {
  static final getVerifiedTokens = _getVerifiedTokensProvider;
  static const isVerifiedToken = _isVerifiedTokenProvider;
  static const getVerifiedTokensFromNetwork =
      _getVerifiedTokensFromNetworkProvider;
  static final verifiedTokens = _verifiedTokensNotifierProvider;
}
