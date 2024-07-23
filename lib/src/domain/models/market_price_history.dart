import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_price_history.freezed.dart';
part 'market_price_history.g.dart';

enum MarketPriceHistoryInterval {
  hour,
  day,
  week,
  twoWeeks,
  month,
  twoMonths,
  year,
}

class PriceHistoryValueConverter
    implements JsonConverter<PriceHistoryValue, Map<String, dynamic>> {
  const PriceHistoryValueConverter();

  @override
  PriceHistoryValue fromJson(Map<String, dynamic> json) {
    return PriceHistoryValue.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(PriceHistoryValue object) => object.toJson();
}

@freezed
class PriceHistoryValue with _$PriceHistoryValue {
  const factory PriceHistoryValue({
    required num price,
    required DateTime time,
  }) = _PriceHistoryValue;

  factory PriceHistoryValue.fromJson(Map<String, dynamic> json) =>
      _$PriceHistoryValueFromJson(json);
}
