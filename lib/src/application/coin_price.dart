/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';

import 'package:archethic_dapp_framework_flutter/src/application/ucids_tokens.dart';
import 'package:archethic_dapp_framework_flutter/src/domain/models/crypto_price.dart';
import 'package:archethic_dapp_framework_flutter/src/infrastructure/coin_price.repository.dart';
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
    state = (await ref.read(_coinPriceRepositoryProvider).fetchPrices())!;

    _timer = Timer.periodic(const Duration(minutes: 1), (_) async {
      state =
          state = (await ref.read(_coinPriceRepositoryProvider).fetchPrices())!;
    });
  }
}

@Riverpod(keepAlive: true)
CoinPriceRepositoryImpl _coinPriceRepository(
  _CoinPriceRepositoryRef ref,
) =>
    CoinPriceRepositoryImpl();

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

  return ref
      .read(_coinPriceRepositoryProvider)
      .getPriceFromUcid(ucid, coinPrice);
}

abstract class CoinPriceProviders {
  static final coinPrice = _coinPriceNotifierProvider;
  static const coinPriceFromAddress = _coinPriceFromAddressProvider;
}
