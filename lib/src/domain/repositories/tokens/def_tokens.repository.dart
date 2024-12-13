import 'package:archethic_dapp_framework_flutter/archethic_dapp_framework_flutter.dart';

// SPDX-License-Identifier: AGPL-3.0-or-later

abstract class DefTokensRepositoryInterface {
  Future<AEToken?> getDefToken(Environment enviroment, String address);
}
