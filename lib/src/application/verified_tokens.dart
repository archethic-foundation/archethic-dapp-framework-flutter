import 'dart:developer';

import 'package:archethic_dapp_framework_flutter/src/domain/models/verified_tokens.dart';
import 'package:archethic_dapp_framework_flutter/src/infrastructure/verified_tokens.repository.dart';
import 'package:archethic_dapp_framework_flutter/src/util/endpoint_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verified_tokens.g.dart';

@Riverpod(keepAlive: true)
class _VerifiedTokensNotifier
    extends Notifier<({String network, List<String> verifiedTokensList})> {
  @override
  ({String network, List<String> verifiedTokensList}) build() {
    return (network: '', verifiedTokensList: <String>[]);
  }

  Future<void> init() async {
    await _getValue();
  }

  Future<void> _getValue() async {
    final network = EndpointUtil.getEnvironnement();
    final verifiedTokensFromNetwork = await ref
        .watch(_verifiedTokensRepositoryProvider)
        .getVerifiedTokensFromNetwork(network);
    log('Verified tokens list ($network) $verifiedTokensFromNetwork');
    state = (network: network, verifiedTokensList: verifiedTokensFromNetwork);
  }
}

@Riverpod(keepAlive: true)
VerifiedTokensRepositoryImpl _verifiedTokensRepository(
  _VerifiedTokensRepositoryRef ref,
) =>
    VerifiedTokensRepositoryImpl();

@Riverpod(keepAlive: true)
Future<VerifiedTokens> _getVerifiedTokens(
  _GetVerifiedTokensRef ref,
) async {
  final verifiedTokens =
      await ref.watch(_verifiedTokensRepositoryProvider).getVerifiedTokens();
  return verifiedTokens;
}

@Riverpod(keepAlive: true)
Future<List<String>> _getVerifiedTokensFromNetwork(
  _GetVerifiedTokensFromNetworkRef ref,
  String network,
) async {
  final verifiedTokensFromNetwork = await ref
      .read(_verifiedTokensRepositoryProvider)
      .getVerifiedTokensFromNetwork(network);
  return verifiedTokensFromNetwork;
}

@Riverpod(keepAlive: true)
Future<bool> _isVerifiedToken(
  _IsVerifiedTokenRef ref,
  String address,
) async {
  final verifiedTokens = ref.watch(_verifiedTokensNotifierProvider);
  return ref
      .read(_verifiedTokensRepositoryProvider)
      .isVerifiedToken(address, verifiedTokens.verifiedTokensList);
}

abstract class VerifiedTokensProviders {
  static final getVerifiedTokens = _getVerifiedTokensProvider;
  static const isVerifiedToken = _isVerifiedTokenProvider;
  static const getVerifiedTokensFromNetwork =
      _getVerifiedTokensFromNetworkProvider;
  static final verifiedTokens = _verifiedTokensNotifierProvider;
}
