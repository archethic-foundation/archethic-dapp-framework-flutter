/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:archethic_dapp_framework_flutter/src/domain/models/verified_tokens.dart';

abstract class VerifiedTokensRepositoryInterface {
  Future<VerifiedTokens> getVerifiedTokens();

  Future<List<String>> getVerifiedTokensFromNetwork();

  Future<bool> isVerifiedToken(
    String address,
    List<String> verifiedTokensList,
  );
}
