/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';
import 'dart:convert';
import 'package:archethic_dapp_framework_flutter/src/application/ucids_tokens.dart';
import 'package:archethic_dapp_framework_flutter/src/domain/models/crypto_price.dart';
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
    // UCIDs
    // 3890 : MATIC
    // 1027 : Ethereum
    // 1839 : BNB
    // 3408 : USDC
    // 20920 : Monerium EURe

    const url =
        'https://fas.archethic.net/api/v1/quotes/latest?ucids=1027,3890,1839,3408,20920';
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
      'matic': jsonData['3890'],
      'ethereum': jsonData['1027'],
      'bnb': jsonData['1839'],
      'usdc': jsonData['3408'],
      'eure': jsonData['20920'],
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
      case 1027:
        return coinPrice.ethereum;
      case 1839:
        return coinPrice.bnb;
      case 3890:
        return coinPrice.matic;
      case 3408:
        return coinPrice.usdc;
      case 20920:
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
