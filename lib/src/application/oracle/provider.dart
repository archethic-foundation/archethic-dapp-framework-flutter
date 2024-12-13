// SPDX-License-Identifier: AGPL-3.0-or-later

import 'dart:async';

import 'package:archethic_dapp_framework_flutter/src/application/oracle/state.dart';
import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
class _ArchethicOracleUCONotifier extends _$ArchethicOracleUCONotifier {
  ArchethicOracle? archethicOracleSubscription;
  final OracleService _oracleService =
      OracleService('https://mainnet.archethic.net');

  static final _logger = Logger('ArchethicOracleUCONotifier');

  @override
  ArchethicOracleUCO build() {
    ref.onDispose(stopSubscription);

    _getValue();

    startSubscription();
    return const ArchethicOracleUCO();
  }

  Future<void> startSubscription() async {
    if (archethicOracleSubscription != null) return;

    _logger.info('Start listening to Oracle');
    await _subscribe();
  }

  Future<void> stopSubscription() async {
    _logger.info('Stop listening to Oracle');
    if (archethicOracleSubscription == null) return;
    _oracleService.closeOracleUpdatesSubscription(archethicOracleSubscription!);
    archethicOracleSubscription = null;
  }

  Future<void> _getValue() async {
    final oracleUcoPrice = await _oracleService.getOracleData();
    _fillInfo(oracleUcoPrice);
  }

  Future<void> _subscribe() async {
    archethicOracleSubscription =
        await _oracleService.subscribeToOracleUpdates((oracleUcoPrice) {
      _fillInfo(oracleUcoPrice!);
    });
  }

  void _fillInfo(OracleUcoPrice oracleUcoPrice) {
    _logger.info('Oracle: ${oracleUcoPrice.timestamp}, ${oracleUcoPrice.uco}');
    state = state.copyWith(
      timestamp: oracleUcoPrice.timestamp ?? 0,
      eur: oracleUcoPrice.uco!.eur ?? 0,
      usd: oracleUcoPrice.uco!.usd ?? 0,
    );
  }
}

abstract class ArchethicOracleUCOProviders {
  static final archethicOracleUCO = _archethicOracleUCONotifierProvider;
}
