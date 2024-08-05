/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';
import 'dart:convert';
import 'package:archethic_dapp_framework_flutter/src/application/ucids_tokens.dart';
import 'package:archethic_dapp_framework_flutter/src/domain/models/crypto_price.dart';
import 'package:archethic_dapp_framework_flutter/src/domain/models/ucid.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coin_price.g.dart';

@Riverpod(keepAlive: true)
class _CoinPriceNotifier extends Notifier<CryptoPrice> {
  Timer? _timer;

  @override
  CryptoPrice build() {
    ref.onDispose(() {
      if (_timer != null) {
        _timer!.cancel();
      }
    });
    return CryptoPrice();
  }

  Future<void> init() async {
    state = (await fetchPrices())!;
    _timer = Timer.periodic(const Duration(minutes: 1), (_) async {
      state = (await fetchPrices())!;
    });
  }

  Future<CryptoPrice?> fetchPrices() async {
    const url =
        'https://fas.archethic.net/api/v1/quotes/latest?ucids=1027,3890,1839,3408,20920,1';
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final pricesMap = _extractPriceMethods(response.body);
        final cryptoPrice = CryptoPrice.fromJson(pricesMap);
        return cryptoPrice.copyWith(
          timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
        );
      }
      // ignore: unused_catch_stack
    } catch (e, stacktrace) {
      /*  aedappfm.sl.get<LogManager>().log(
            e.toString(),
            stackTrace: stacktrace,
            level: LogLevel.error,
            name: 'CoinPriceNotifier - _fetchPrices',
          );*/
    }

    return CryptoPrice();
  }

  Map<String, double> _extractPriceMethods(String responseBody) {
    final jsonData = json.decode(responseBody) as Map<String, dynamic>;
    return {
      'bitcoin': jsonData[UCID.bitcoin.toString()],
      'matic': jsonData[UCID.matic.toString()],
      'ethereum': jsonData[UCID.ethereum.toString()],
      'bnb': jsonData[UCID.bnb.toString()],
      'usdc': jsonData[UCID.usdc.toString()],
      'eure': jsonData[UCID.eure.toString()],
    };
  }
}

@riverpod
double _coinPriceFromAddress(
  _CoinPriceFromAddressRef ref,
  String address,
) {
  final coinPrice = ref.read(
    CoinPriceProviders.coinPrice,
  );
  final ucidsList = ref.read(UcidsTokensProviders.ucidsTokens);

  final ucid = ucidsList[address.toUpperCase()] ?? 0;
  if (ucid != 0) {
    switch (ucid) {
      case UCID.bitcoin:
        return coinPrice.bitcoin;
      case UCID.ethereum:
        return coinPrice.ethereum;
      case UCID.bnb:
        return coinPrice.bnb;
      case UCID.matic:
        return coinPrice.matic;
      case UCID.usdc:
        return coinPrice.usdc;
      case UCID.eure:
        return coinPrice.eure;
      default:
        return 0;
    }
  }
  return 0;
}

abstract class CoinPriceProviders {
  static final coinPrice = _coinPriceNotifierProvider;
  static const coinPriceFromAddress = _coinPriceFromAddressProvider;
}
