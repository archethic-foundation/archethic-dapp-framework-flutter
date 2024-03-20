/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:archethic_dapp_framework_flutter/src/domain/models/verified_tokens.dart';

abstract class VerifiedTokensRepositoryInterface {
  Future<VerifiedTokens> getVerifiedTokens();
}
