// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:archethic_dapp_framework_flutter/src/domain/models/crypto_price.dart';

abstract class CoinPriceRepositoryInterface {
  Future<CryptoPrice?> fetchPrices();

  double getPriceFromUcid(int ucid, CryptoPrice coinPrice);
}
