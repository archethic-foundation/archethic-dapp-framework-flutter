// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_dapp_framework_flutter/src/domain/models/ae_token_pair.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ae_token.freezed.dart';
part 'ae_token.g.dart';

/// Provides JSON conversion for [AEToken].
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

/// A class representing a token in the Archethic network.
@freezed
class AEToken with _$AEToken {
  /// Creates an [AEToken] instance.
  ///
  /// The [name], [symbol], [balance], [reserve], and [supply] have default values.
  /// If no [address] or [ucid] is provided, they will remain null.
  const factory AEToken({
    /// The name of the token.
    @Default('') String name,

    /// The address of the token on the Archethic blockchain.
    String? address,

    /// The icon URL or path representing the token.
    String? icon,

    /// The symbol of the token.
    @Default('') String symbol,

    /// The current balance of the token.
    @Default(0.0) double balance,

    /// The reserve balance of the token.
    @Default(0.0) double reserve,

    /// The total supply of the token.
    @Default(0.0) double supply,

    /// Indicates if the token is verified.
    @Default(false) bool isVerified,

    /// Indicates if the token is a liquidity provider token.
    @Default(false) bool isLpToken,

    /// The pair of tokens for LP tokens.
    @AETokenPairJsonConverter() AETokenPair? lpTokenPair,
    int? ucid,
  }) = _AEToken;
  const AEToken._();

  /// Creates an [AEToken] instance from a JSON object.
  factory AEToken.fromJson(Map<String, dynamic> json) =>
      _$AETokenFromJson(json);

  /// Determines if the token is the Archethic Universal Coin (UCO).
  bool get isUCO => symbol == 'UCO' && (address == null || address! == 'UCO');
}

/// A constant instance of the Archethic Universal Coin (UCO) token.
AEToken get ucoToken => const AEToken(
      name: 'Universal Coin',
      symbol: 'UCO',
      ucid: 6887,
    );
