// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArchethicOracleUCO _$ArchethicOracleUCOFromJson(Map<String, dynamic> json) {
  return _ArchethicOracleUCO.fromJson(json);
}

/// @nodoc
mixin _$ArchethicOracleUCO {
  /// The timestamp (UNIX format) when the data was retrieved.
  int get timestamp => throw _privateConstructorUsedError;

  /// The price of UCO in Euros.
  double get eur => throw _privateConstructorUsedError;

  /// The price of UCO in US Dollars.
  double get usd => throw _privateConstructorUsedError;

  /// Serializes this ArchethicOracleUCO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArchethicOracleUCO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArchethicOracleUCOCopyWith<ArchethicOracleUCO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArchethicOracleUCOCopyWith<$Res> {
  factory $ArchethicOracleUCOCopyWith(
          ArchethicOracleUCO value, $Res Function(ArchethicOracleUCO) then) =
      _$ArchethicOracleUCOCopyWithImpl<$Res, ArchethicOracleUCO>;
  @useResult
  $Res call({int timestamp, double eur, double usd});
}

/// @nodoc
class _$ArchethicOracleUCOCopyWithImpl<$Res, $Val extends ArchethicOracleUCO>
    implements $ArchethicOracleUCOCopyWith<$Res> {
  _$ArchethicOracleUCOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArchethicOracleUCO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? eur = null,
    Object? usd = null,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      eur: null == eur
          ? _value.eur
          : eur // ignore: cast_nullable_to_non_nullable
              as double,
      usd: null == usd
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArchethicOracleUCOImplCopyWith<$Res>
    implements $ArchethicOracleUCOCopyWith<$Res> {
  factory _$$ArchethicOracleUCOImplCopyWith(_$ArchethicOracleUCOImpl value,
          $Res Function(_$ArchethicOracleUCOImpl) then) =
      __$$ArchethicOracleUCOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int timestamp, double eur, double usd});
}

/// @nodoc
class __$$ArchethicOracleUCOImplCopyWithImpl<$Res>
    extends _$ArchethicOracleUCOCopyWithImpl<$Res, _$ArchethicOracleUCOImpl>
    implements _$$ArchethicOracleUCOImplCopyWith<$Res> {
  __$$ArchethicOracleUCOImplCopyWithImpl(_$ArchethicOracleUCOImpl _value,
      $Res Function(_$ArchethicOracleUCOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArchethicOracleUCO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? eur = null,
    Object? usd = null,
  }) {
    return _then(_$ArchethicOracleUCOImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      eur: null == eur
          ? _value.eur
          : eur // ignore: cast_nullable_to_non_nullable
              as double,
      usd: null == usd
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArchethicOracleUCOImpl implements _ArchethicOracleUCO {
  const _$ArchethicOracleUCOImpl(
      {this.timestamp = 0, this.eur = 0, this.usd = 0});

  factory _$ArchethicOracleUCOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArchethicOracleUCOImplFromJson(json);

  /// The timestamp (UNIX format) when the data was retrieved.
  @override
  @JsonKey()
  final int timestamp;

  /// The price of UCO in Euros.
  @override
  @JsonKey()
  final double eur;

  /// The price of UCO in US Dollars.
  @override
  @JsonKey()
  final double usd;

  @override
  String toString() {
    return 'ArchethicOracleUCO(timestamp: $timestamp, eur: $eur, usd: $usd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArchethicOracleUCOImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.eur, eur) || other.eur == eur) &&
            (identical(other.usd, usd) || other.usd == usd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, eur, usd);

  /// Create a copy of ArchethicOracleUCO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArchethicOracleUCOImplCopyWith<_$ArchethicOracleUCOImpl> get copyWith =>
      __$$ArchethicOracleUCOImplCopyWithImpl<_$ArchethicOracleUCOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArchethicOracleUCOImplToJson(
      this,
    );
  }
}

abstract class _ArchethicOracleUCO implements ArchethicOracleUCO {
  const factory _ArchethicOracleUCO(
      {final int timestamp,
      final double eur,
      final double usd}) = _$ArchethicOracleUCOImpl;

  factory _ArchethicOracleUCO.fromJson(Map<String, dynamic> json) =
      _$ArchethicOracleUCOImpl.fromJson;

  /// The timestamp (UNIX format) when the data was retrieved.
  @override
  int get timestamp;

  /// The price of UCO in Euros.
  @override
  double get eur;

  /// The price of UCO in US Dollars.
  @override
  double get usd;

  /// Create a copy of ArchethicOracleUCO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArchethicOracleUCOImplCopyWith<_$ArchethicOracleUCOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
