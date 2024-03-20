/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'dart:convert';
import 'package:archethic_dapp_framework_flutter/src/domain/models/verified_tokens.dart';
import 'package:archethic_dapp_framework_flutter/src/domain/repositories/tokens/verified_tokens.repository.dart';
import 'package:flutter/services.dart';

class VerifiedTokensRepositoryImpl
    implements VerifiedTokensRepositoryInterface {
  @override
  Future<VerifiedTokens> getVerifiedTokens() async {
    final jsonContent = await rootBundle
        .loadString('lib/domain/repositories/tokens/verified_tokens.json');

    final Map<String, dynamic> jsonData = json.decode(jsonContent);

    return VerifiedTokens.fromJson(jsonData);
  }
}
