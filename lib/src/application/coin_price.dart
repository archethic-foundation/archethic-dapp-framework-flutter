/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';

import 'package:archethic_dapp_framework_flutter/archethic_dapp_framework_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coin_price.g.dart';

@Riverpod(keepAlive: true)
class _CoinPricesNotifier extends Notifier<CryptoPrice> {
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
Future<double> _coinPrice(
  _CoinPriceRef ref, {
  required String address,
  String? network,
}) async {
  final coinPrice = ref.watch(
    CoinPriceProviders.coinPrices,
  );
  final ucid = await ref.watch(
    UcidsTokensProviders.ucid(
      address: address.toUpperCase(),
      network: network,
    ).future,
  );

  return ref
      .read(_coinPriceRepositoryProvider)
      .getPriceFromUcid(ucid, coinPrice);
}

abstract class CoinPriceProviders {
  static final coinPrices = _coinPricesNotifierProvider;
  static const coinPrice = _coinPriceProvider;
}
