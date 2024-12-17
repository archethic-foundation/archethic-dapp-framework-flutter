// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CryptoPrice _$CryptoPriceFromJson(Map<String, dynamic> json) {
  return _CryptoPrice.fromJson(json);
}

/// @nodoc
mixin _$CryptoPrice {
  /// The timestamp of the price data, represented as a UNIX timestamp.
  int? get timestamp => throw _privateConstructorUsedError;

  /// The price of Bitcoin (BTC) in USD or the relevant currency.
  double get bitcoin => throw _privateConstructorUsedError;

  /// The price of Matic (Polygon) in USD or the relevant currency.
  double get matic => throw _privateConstructorUsedError;

  /// The price of Ethereum (ETH) in USD or the relevant currency.
  double get ethereum => throw _privateConstructorUsedError;

  /// The price of Binance Coin (BNB) in USD or the relevant currency.
  double get bnb => throw _privateConstructorUsedError;

  /// The price of USD Coin (USDC) in USD or the relevant currency.
  double get usdc => throw _privateConstructorUsedError;

  /// The price of EURE (a euro-backed stablecoin) in USD or the relevant currency.
  double get eure => throw _privateConstructorUsedError;

  /// Serializes this CryptoPrice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CryptoPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CryptoPriceCopyWith<CryptoPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoPriceCopyWith<$Res> {
  factory $CryptoPriceCopyWith(
          CryptoPrice value, $Res Function(CryptoPrice) then) =
      _$CryptoPriceCopyWithImpl<$Res, CryptoPrice>;
  @useResult
  $Res call(
      {int? timestamp,
      double bitcoin,
      double matic,
      double ethereum,
      double bnb,
      double usdc,
      double eure});
}

/// @nodoc
class _$CryptoPriceCopyWithImpl<$Res, $Val extends CryptoPrice>
    implements $CryptoPriceCopyWith<$Res> {
  _$CryptoPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CryptoPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = freezed,
    Object? bitcoin = null,
    Object? matic = null,
    Object? ethereum = null,
    Object? bnb = null,
    Object? usdc = null,
    Object? eure = null,
  }) {
    return _then(_value.copyWith(
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      bitcoin: null == bitcoin
          ? _value.bitcoin
          : bitcoin // ignore: cast_nullable_to_non_nullable
              as double,
      matic: null == matic
          ? _value.matic
          : matic // ignore: cast_nullable_to_non_nullable
              as double,
      ethereum: null == ethereum
          ? _value.ethereum
          : ethereum // ignore: cast_nullable_to_non_nullable
              as double,
      bnb: null == bnb
          ? _value.bnb
          : bnb // ignore: cast_nullable_to_non_nullable
              as double,
      usdc: null == usdc
          ? _value.usdc
          : usdc // ignore: cast_nullable_to_non_nullable
              as double,
      eure: null == eure
          ? _value.eure
          : eure // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CryptoPriceImplCopyWith<$Res>
    implements $CryptoPriceCopyWith<$Res> {
  factory _$$CryptoPriceImplCopyWith(
          _$CryptoPriceImpl value, $Res Function(_$CryptoPriceImpl) then) =
      __$$CryptoPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? timestamp,
      double bitcoin,
      double matic,
      double ethereum,
      double bnb,
      double usdc,
      double eure});
}

/// @nodoc
class __$$CryptoPriceImplCopyWithImpl<$Res>
    extends _$CryptoPriceCopyWithImpl<$Res, _$CryptoPriceImpl>
    implements _$$CryptoPriceImplCopyWith<$Res> {
  __$$CryptoPriceImplCopyWithImpl(
      _$CryptoPriceImpl _value, $Res Function(_$CryptoPriceImpl) _then)
      : super(_value, _then);

  /// Create a copy of CryptoPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = freezed,
    Object? bitcoin = null,
    Object? matic = null,
    Object? ethereum = null,
    Object? bnb = null,
    Object? usdc = null,
    Object? eure = null,
  }) {
    return _then(_$CryptoPriceImpl(
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      bitcoin: null == bitcoin
          ? _value.bitcoin
          : bitcoin // ignore: cast_nullable_to_non_nullable
              as double,
      matic: null == matic
          ? _value.matic
          : matic // ignore: cast_nullable_to_non_nullable
              as double,
      ethereum: null == ethereum
          ? _value.ethereum
          : ethereum // ignore: cast_nullable_to_non_nullable
              as double,
      bnb: null == bnb
          ? _value.bnb
          : bnb // ignore: cast_nullable_to_non_nullable
              as double,
      usdc: null == usdc
          ? _value.usdc
          : usdc // ignore: cast_nullable_to_non_nullable
              as double,
      eure: null == eure
          ? _value.eure
          : eure // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CryptoPriceImpl implements _CryptoPrice {
  _$CryptoPriceImpl(
      {this.timestamp,
      this.bitcoin = 0.0,
      this.matic = 0.0,
      this.ethereum = 0.0,
      this.bnb = 0.0,
      this.usdc = 0.0,
      this.eure = 0.0});

  factory _$CryptoPriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CryptoPriceImplFromJson(json);

  /// The timestamp of the price data, represented as a UNIX timestamp.
  @override
  final int? timestamp;

  /// The price of Bitcoin (BTC) in USD or the relevant currency.
  @override
  @JsonKey()
  final double bitcoin;

  /// The price of Matic (Polygon) in USD or the relevant currency.
  @override
  @JsonKey()
  final double matic;

  /// The price of Ethereum (ETH) in USD or the relevant currency.
  @override
  @JsonKey()
  final double ethereum;

  /// The price of Binance Coin (BNB) in USD or the relevant currency.
  @override
  @JsonKey()
  final double bnb;

  /// The price of USD Coin (USDC) in USD or the relevant currency.
  @override
  @JsonKey()
  final double usdc;

  /// The price of EURE (a euro-backed stablecoin) in USD or the relevant currency.
  @override
  @JsonKey()
  final double eure;

  @override
  String toString() {
    return 'CryptoPrice(timestamp: $timestamp, bitcoin: $bitcoin, matic: $matic, ethereum: $ethereum, bnb: $bnb, usdc: $usdc, eure: $eure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoPriceImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.bitcoin, bitcoin) || other.bitcoin == bitcoin) &&
            (identical(other.matic, matic) || other.matic == matic) &&
            (identical(other.ethereum, ethereum) ||
                other.ethereum == ethereum) &&
            (identical(other.bnb, bnb) || other.bnb == bnb) &&
            (identical(other.usdc, usdc) || other.usdc == usdc) &&
            (identical(other.eure, eure) || other.eure == eure));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, timestamp, bitcoin, matic, ethereum, bnb, usdc, eure);

  /// Create a copy of CryptoPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoPriceImplCopyWith<_$CryptoPriceImpl> get copyWith =>
      __$$CryptoPriceImplCopyWithImpl<_$CryptoPriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CryptoPriceImplToJson(
      this,
    );
  }
}

abstract class _CryptoPrice implements CryptoPrice {
  factory _CryptoPrice(
      {final int? timestamp,
      final double bitcoin,
      final double matic,
      final double ethereum,
      final double bnb,
      final double usdc,
      final double eure}) = _$CryptoPriceImpl;

  factory _CryptoPrice.fromJson(Map<String, dynamic> json) =
      _$CryptoPriceImpl.fromJson;

  /// The timestamp of the price data, represented as a UNIX timestamp.
  @override
  int? get timestamp;

  /// The price of Bitcoin (BTC) in USD or the relevant currency.
  @override
  double get bitcoin;

  /// The price of Matic (Polygon) in USD or the relevant currency.
  @override
  double get matic;

  /// The price of Ethereum (ETH) in USD or the relevant currency.
  @override
  double get ethereum;

  /// The price of Binance Coin (BNB) in USD or the relevant currency.
  @override
  double get bnb;

  /// The price of USD Coin (USDC) in USD or the relevant currency.
  @override
  double get usdc;

  /// The price of EURE (a euro-backed stablecoin) in USD or the relevant currency.
  @override
  double get eure;

  /// Create a copy of CryptoPrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CryptoPriceImplCopyWith<_$CryptoPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
