import 'package:archethic_dapp_framework_flutter/src/application/api_service.dart';
import 'package:archethic_dapp_framework_flutter/src/domain/models/environment.dart';
import 'package:archethic_dapp_framework_flutter/src/domain/repositories/tokens/verified_tokens.repository.dart';
import 'package:archethic_dapp_framework_flutter/src/infrastructure/verified_tokens.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verified_tokens.g.dart';

@riverpod
VerifiedTokensRepositoryInterface _verifiedTokensRepository(
  _VerifiedTokensRepositoryRef ref,
  Environment environment,
) {
  final apiService = ref.watch(apiServiceProvider(environment));
  return VerifiedTokensRepositoryImpl(
    apiService: apiService,
    environment: environment,
  );
}

@riverpod
Future<List<String>> _verifiedTokensByNetwork(
  _VerifiedTokensByNetworkRef ref,
  Environment environment,
) async {
  return ref
      .watch(_verifiedTokensRepositoryProvider(environment))
      .getVerifiedTokens();
}

@riverpod
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
  static const isVerifiedToken = _isVerifiedTokenProvider;
  static const verifiedTokensByNetwork = _verifiedTokensByNetworkProvider;
}
