/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';

import 'package:archethic_dapp_framework_flutter/archethic_dapp_framework_flutter.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coin_price.g.dart';

@Riverpod(keepAlive: true)
class _CoinPricesNotifier extends Notifier<CryptoPrice> {
  static final _logger = Logger('CoinPricesNotifier');

  Timer? _timer;

  @override
  CryptoPrice build() {
    ref.onDispose(() {
      if (_timer != null) {
        _timer!.cancel();
      }
    });

    _getValue();

    return CryptoPrice();
  }

  Future<void> startTimer() async {
    if (_timer != null) return;

    _logger.info('Start timer');
    _timer = Timer.periodic(const Duration(minutes: 1), (_) async {
      state = (await ref.read(_coinPriceRepositoryProvider).fetchPrices())!;
    });
  }

  Future<void> stopTimer() async {
    _logger.info('Stop timer');
    if (_timer == null) return;
    _timer?.cancel();
  }

  Future<void> _getValue() async {
    state = (await ref.read(_coinPriceRepositoryProvider).fetchPrices())!;
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
  try {
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
  } catch (e) {
    return 0;
  }
}

abstract class CoinPriceProviders {
  static final coinPrices = _coinPricesNotifierProvider;
  static const coinPrice = _coinPriceProvider;
}
