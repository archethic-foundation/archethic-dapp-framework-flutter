import 'package:archethic_dapp_framework_flutter/archethic_dapp_framework_flutter.dart'
    as aedappfm;
import 'package:archethic_dapp_framework_flutter/src/domain/models/ae_token.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ae_token.g.dart';

@riverpod
Future<double> _estimateTokenInFiat(
  Ref ref,
  AEToken token,
) async {
  if (token.symbol == 'UCO') {
    final archethicOracleUCO =
        ref.watch(aedappfm.ArchethicOracleUCOProviders.archethicOracleUCO);

    return archethicOracleUCO.usd;
  } else {
    return await ref.watch(
      aedappfm.CoinPriceProviders.coinPrice(address: token.address!).future,
    );
  }
}

abstract class AETokensProviders {
  static const estimateTokenInFiat = _estimateTokenInFiatProvider;
}
