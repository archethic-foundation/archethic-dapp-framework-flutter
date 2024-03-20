/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'dart:convert';
import 'dart:developer';
import 'package:archethic_dapp_framework_flutter/src/domain/models/verified_tokens.dart';
import 'package:archethic_dapp_framework_flutter/src/domain/repositories/tokens/verified_tokens.repository.dart';
import 'package:archethic_dapp_framework_flutter/src/util/generic/get_it_instance.dart';
import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:flutter/services.dart';

class VerifiedTokensRepositoryImpl
    implements VerifiedTokensRepositoryInterface {
  @override
  Future<VerifiedTokens> getVerifiedTokens() async {
    final jsonContent = await rootBundle.loadString(
      'packages/archethic_dapp_framework_flutter/lib/src/domain/repositories/tokens/verified_tokens.json',
    );

    final Map<String, dynamic> jsonData = json.decode(jsonContent);

    return VerifiedTokens.fromJson(jsonData);
  }

  @override
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

  Future<bool> isVerifiedToken(
    String address,
    List<String> verifiedTokensList,
  ) async {
    log('verifiedTokens $verifiedTokensList');
    if (verifiedTokensList.contains(address.toUpperCase())) {
      return true;
    }
    return false;
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
