import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_price.freezed.dart';
part 'crypto_price.g.dart';

@freezed
class CryptoPrice with _$CryptoPrice {
  factory CryptoPrice({
    int? timestamp,
    @Default(0.0) double bitcoin,
    @Default(0.0) double matic,
    @Default(0.0) double ethereum,
    @Default(0.0) double bnb,
    @Default(0.0) double usdc,
    @Default(0.0) double eure,
  }) = _CryptoPrice;

  factory CryptoPrice.fromJson(Map<String, dynamic> json) =>
      _$CryptoPriceFromJson(json);
}
