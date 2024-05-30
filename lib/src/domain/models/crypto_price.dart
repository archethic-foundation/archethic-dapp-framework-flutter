import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_price.freezed.dart';
part 'crypto_price.g.dart';

@freezed
class CryptoPrice with _$CryptoPrice {
  factory CryptoPrice({
    int? timestamp,
    // Used UCIDs
    @Default(0.0) double matic, // 3890
    @Default(0.0) double ethereum, // 1027
    @Default(0.0) double bnb, // 1839
    @Default(0.0) double usdc, // 3408
    @Default(0.0) double eure, // 20920
  }) = _CryptoPrice;

  factory CryptoPrice.fromJson(Map<String, dynamic> json) =>
      _$CryptoPriceFromJson(json);
}
