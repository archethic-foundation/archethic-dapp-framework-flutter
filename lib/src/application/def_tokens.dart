import 'package:archethic_dapp_framework_flutter/src/domain/models/ae_token.dart';
import 'package:archethic_dapp_framework_flutter/src/domain/models/environment.dart';
import 'package:archethic_dapp_framework_flutter/src/infrastructure/def_tokens.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'def_tokens.g.dart';

@riverpod
DefTokensRepositoryImpl defTokensRepositoryImpl(
  Ref ref,
) =>
    DefTokensRepositoryImpl();

@riverpod
Future<AEToken?> getDefToken(
  Ref ref,
  Environment environment,
  String address,
) async {
  return ref
      .watch(defTokensRepositoryImplProvider)
      .getDefToken(environment, address);
}
