import 'package:archethic_dapp_framework_flutter/archethic_dapp_framework_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ucids_tokens.g.dart';

@Riverpod(keepAlive: true)
Future<Map<String, int>> _ucidsTokens(
  _UcidsTokensRef ref, {
  Environment? environment,
}) async {
  if (environment != null) {
    return ref
        .watch(_ucidsTokensRepositoryProvider)
        .getUcidsTokensFromNetwork(environment);
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

// TODO(reddwarf03): Return null instead of invalidValue
@Riverpod(keepAlive: true)
Future<int> _ucid(
  _UcidRef ref, {
  required String address,
  Environment? environment,
}) async {
  final ucidsTokens = await ref.watch(
    _ucidsTokensProvider(environment: environment).future,
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
