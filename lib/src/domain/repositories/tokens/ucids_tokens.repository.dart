// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_dapp_framework_flutter/src/domain/models/environment.dart';
import 'package:archethic_dapp_framework_flutter/src/domain/models/ucids_tokens.dart';

abstract class UcidsTokensRepositoryInterface {
  Future<UcidsTokens> getUcidsTokens();

  Future<Map<String, int>> getUcidsTokensFromNetwork(Environment environment);
}
