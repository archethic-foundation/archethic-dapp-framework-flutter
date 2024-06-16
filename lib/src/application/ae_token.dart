import 'package:archethic_dapp_framework_flutter/archethic_dapp_framework_flutter.dart'
    as aedappfm;
import 'package:archethic_dapp_framework_flutter/src/domain/models/ae_token.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ae_token.g.dart';

@riverpod
double _estimateTokenInFiat(
  _EstimateTokenInFiatRef ref,
  AEToken token,
) {
  var fiatValue = 0.0;
  if (token.symbol == 'UCO') {
    final archethicOracleUCO =
        ref.watch(aedappfm.ArchethicOracleUCOProviders.archethicOracleUCO);

    fiatValue = archethicOracleUCO.usd;
  } else {
    final price = ref.watch(
      aedappfm.CoinPriceProviders.coinPriceFromAddress(token.address!),
    );

    fiatValue = price;
  }
  return fiatValue;
}

abstract class AETokensProviders {
  static const estimateTokenInFiat = _estimateTokenInFiatProvider;
}
