/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_dapp_framework_flutter/src/domain/models/ae_token_pair.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ae_token.freezed.dart';
part 'ae_token.g.dart';

class AETokenJsonConverter
    implements JsonConverter<AEToken, Map<String, dynamic>> {
  const AETokenJsonConverter();

  @override
  AEToken fromJson(Map<String, dynamic> json) {
    return AEToken.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(AEToken object) => object.toJson();
}

@freezed
class AEToken with _$AEToken {
  const factory AEToken({
    @Default('') String name,
    String? address,
    String? icon,
    @Default('') String symbol,
    @Default(0.0) double balance,
    @Default(0.0) double reserve,
    @Default(0.0) double supply,
    @Default(false) bool isVerified,
    @Default(false) bool isLpToken,
    @AETokenPairJsonConverter() AETokenPair? lpTokenPair,
    int? ucid,
  }) = _AEToken;
  const AEToken._();

  factory AEToken.fromJson(Map<String, dynamic> json) =>
      _$AETokenFromJson(json);

  bool get isUCO => symbol == 'UCO' && (address == null || address! == 'UCO');
}

AEToken get ucoToken => const AEToken(name: 'Universal Coin', symbol: 'UCO');
