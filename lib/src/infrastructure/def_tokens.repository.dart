import 'dart:convert';

import 'package:archethic_dapp_framework_flutter/archethic_dapp_framework_flutter.dart';
import 'package:flutter/services.dart';

class DefTokensRepositoryImpl implements DefTokensRepositoryInterface {
  DefTokensRepositoryImpl();

  @override
  Future<AEToken?> getDefToken(Environment environment, String address) async {
    final jsonContent = await rootBundle.loadString(
      'packages/archethic_dapp_framework_flutter/lib/src/domain/repositories/tokens/def_tokens.json',
    );

    final jsonData = jsonDecode(jsonContent);

    try {
      final tokens = jsonData['tokens'][environment.name] as List<dynamic>;
      AEToken? defToken;
      for (final token in tokens) {
        if (token['address'].toString().toUpperCase() ==
            address.toUpperCase()) {
          defToken = AEToken(
            name: token['name'],
            ucid: token['ucid'],
            icon: token['icon'],
            address: token['address'].toString().toUpperCase(),
            symbol: token['symbol'],
          );

          break;
        }
      }
      return defToken;
    } catch (e) {
      return null;
    }
  }
}
