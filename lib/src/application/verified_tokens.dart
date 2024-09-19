import 'package:archethic_dapp_framework_flutter/src/application/api_service.dart';
import 'package:archethic_dapp_framework_flutter/src/domain/models/environment.dart';
import 'package:archethic_dapp_framework_flutter/src/domain/models/verified_tokens.dart';
import 'package:archethic_dapp_framework_flutter/src/domain/repositories/tokens/verified_tokens.repository.dart';
import 'package:archethic_dapp_framework_flutter/src/infrastructure/verified_tokens.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verified_tokens.g.dart';

@Riverpod(keepAlive: true)
Future<List<String>> _verifiedTokensByNetwork(
  _VerifiedTokensByNetworkRef ref,
  Environment environment,
) async {
  return ref
      .watch(_verifiedTokensRepositoryProvider(environment))
      .getVerifiedTokensFromNetwork();
}

@Riverpod(keepAlive: true)
VerifiedTokensRepositoryInterface _verifiedTokensRepository(
  _VerifiedTokensRepositoryRef ref,
  Environment environment,
) {
  return VerifiedTokensRepositoryImpl(
    apiService: ref.watch(apiServiceProvider(environment)),
    environment: environment,
  );
}

@Riverpod(keepAlive: true)
Future<VerifiedTokens> _getVerifiedTokens(
  _GetVerifiedTokensRef ref,
  Environment environment,
) async {
  final verifiedTokens = await ref
      .watch(_verifiedTokensRepositoryProvider(environment))
      .getVerifiedTokens();
  return verifiedTokens;
}

@Riverpod(keepAlive: true)
Future<List<String>> _getVerifiedTokensFromNetwork(
  _GetVerifiedTokensFromNetworkRef ref,
  Environment environment,
) async {
  final verifiedTokensFromNetwork = await ref
      .watch(_verifiedTokensRepositoryProvider(environment))
      .getVerifiedTokensFromNetwork();
  return verifiedTokensFromNetwork;
}

@Riverpod(keepAlive: true)
Future<bool> _isVerifiedToken(
  _IsVerifiedTokenRef ref,
  Environment environment,
  String address,
) async {
  final verifiedTokens =
      await ref.watch(_verifiedTokensByNetworkProvider(environment).future);
  return ref
      .watch(_verifiedTokensRepositoryProvider(environment))
      .isVerifiedToken(address, verifiedTokens);
}

abstract class VerifiedTokensProviders {
  static const verifiedTokensRepository = _verifiedTokensRepositoryProvider;
  static const getVerifiedTokens = _getVerifiedTokensProvider;
  static const isVerifiedToken = _isVerifiedTokenProvider;
  static const getVerifiedTokensFromNetwork =
      _getVerifiedTokensFromNetworkProvider;
  static const verifiedTokensByNetwork = _verifiedTokensByNetworkProvider;
}
