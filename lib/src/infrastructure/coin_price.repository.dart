/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'dart:convert';
import 'package:archethic_dapp_framework_flutter/src/domain/models/crypto_price.dart';
import 'package:archethic_dapp_framework_flutter/src/domain/repositories/tokens/coin_price.repository.dart';
import 'package:http/http.dart' as http;

class CoinPriceRepositoryImpl implements CoinPriceRepositoryInterface {
  @override
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
      // ignore: unused_catch_stack, empty_catches
    } catch (e, stacktrace) {}

    return CryptoPrice();
  }

  // TODO(reddwarf03): Externalise this...
  @override
  double getPriceFromUcid(int ucid, CryptoPrice coinPrice) {
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
