// SPDX-License-Identifier: AGPL-3.0-or-later

import 'dart:async';

import 'package:archethic_dapp_framework_flutter/src/application/oracle/state.dart';
import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
class _ArchethicOracleUCONotifier extends _$ArchethicOracleUCONotifier {
  StreamSubscription? archethicOracleSubscription;
  final OracleService _oracleService =
      OracleService('https://mainnet.archethic.net');

  static final _logger = Logger('ArchethicOracleUCONotifier');

  @override
  Future<ArchethicOracleUCO> build() async {
    ref.onDispose(stopSubscription);

    return _subscribe();
  }

  Future<void> startSubscription() async {
    if (archethicOracleSubscription != null) return;

    final oracleValue = await _subscribe();

    await update((_) {
      return oracleValue;
    });
  }

  /// Starts listening to oracle stream.
  ///
  /// Retrieves and returns current oracle value.
  /// This is useful to immediately get oracle state.
  Future<ArchethicOracleUCO> _subscribe() async {
    _logger.info('Start listening to Oracle');
    final oracleUcoPrice = await _oracleService.getOracleData();

    final oracleStream = await _oracleService.subscribe();

    archethicOracleSubscription =
        oracleStream.map((event) => event.toArchethic).listen((oracleEvent) {
      _logger.info(
        'Oracle: ${oracleEvent.timestamp}, eur: ${oracleEvent.eur}, usd: ${oracleEvent.usd}',
      );
      update((_) {
        return oracleEvent;
      });
    });
    return oracleUcoPrice.toArchethic;
  }

  Future<void> stopSubscription() async {
    _logger.info('Stop listening to Oracle');
    if (archethicOracleSubscription == null) return;
    await archethicOracleSubscription?.cancel();
    archethicOracleSubscription = null;
  }
}

abstract class ArchethicOracleUCOProviders {
  static final archethicOracleUCO = _archethicOracleUCONotifierProvider;
}
