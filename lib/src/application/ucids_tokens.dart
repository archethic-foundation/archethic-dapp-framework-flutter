import 'package:archethic_dapp_framework_flutter/archethic_dapp_framework_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ucids_tokens.g.dart';

@Riverpod(keepAlive: true)
Future<Map<String, int>> _ucidsTokens(
  _UcidsTokensRef ref, {
  String? network,
}) async {
  if (network != null) {
    return ref
        .watch(_ucidsTokensRepositoryProvider)
        .getUcidsTokensFromNetwork(network);
  }

  final allUcids = await ref
      .watch(
        _ucidsTokensRepositoryProvider,
      )
      .getUcidsTokens();
  return {
    ...allUcids.devnet,
    ...allUcids.testnet,
    ...allUcids.mainnet,
  };
}

@Riverpod(keepAlive: true)
Future<int> _ucid(
  _UcidRef ref, {
  required String address,
  String? network,
}) async {
  final ucidsTokens = await ref.watch(
    _ucidsTokensProvider(network: network).future,
  );

  final ucid = ucidsTokens[address];
  if (ucid == null) {
    throw const Failure.invalidValue();
  }
  return ucid;
}

@Riverpod(keepAlive: true)
UcidsTokensRepositoryImpl _ucidsTokensRepository(
  _UcidsTokensRepositoryRef ref,
) =>
    UcidsTokensRepositoryImpl();

abstract class UcidsTokensProviders {
  static const ucidsTokens = _ucidsTokensProvider;
  static const ucid = _ucidProvider;
}
