// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_dapp_framework_flutter/src/domain/models/ae_token.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ae_token_pair.freezed.dart';
part 'ae_token_pair.g.dart';

class AETokenPairJsonConverter
    implements JsonConverter<AETokenPair, Map<String, dynamic>> {
  const AETokenPairJsonConverter();

  @override
  AETokenPair fromJson(Map<String, dynamic> json) {
    return AETokenPair.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(AETokenPair object) => object.toJson();
}

@freezed
class AETokenPair with _$AETokenPair {
  const factory AETokenPair({
    @AETokenJsonConverter() required AEToken token1,
    @AETokenJsonConverter() required AEToken token2,
  }) = _AETokenPair;

  const AETokenPair._();

  factory AETokenPair.fromJson(Map<String, dynamic> json) =>
      _$AETokenPairFromJson(json);
}
