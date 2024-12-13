// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ae_token_pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AETokenPair _$AETokenPairFromJson(Map<String, dynamic> json) {
  return _AETokenPair.fromJson(json);
}

/// @nodoc
mixin _$AETokenPair {
  @AETokenJsonConverter()
  AEToken get token1 => throw _privateConstructorUsedError;
  @AETokenJsonConverter()
  AEToken get token2 => throw _privateConstructorUsedError;

  /// Serializes this AETokenPair to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AETokenPair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AETokenPairCopyWith<AETokenPair> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AETokenPairCopyWith<$Res> {
  factory $AETokenPairCopyWith(
          AETokenPair value, $Res Function(AETokenPair) then) =
      _$AETokenPairCopyWithImpl<$Res, AETokenPair>;
  @useResult
  $Res call(
      {@AETokenJsonConverter() AEToken token1,
      @AETokenJsonConverter() AEToken token2});

  $AETokenCopyWith<$Res> get token1;
  $AETokenCopyWith<$Res> get token2;
}

/// @nodoc
class _$AETokenPairCopyWithImpl<$Res, $Val extends AETokenPair>
    implements $AETokenPairCopyWith<$Res> {
  _$AETokenPairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AETokenPair
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token1 = null,
    Object? token2 = null,
  }) {
    return _then(_value.copyWith(
      token1: null == token1
          ? _value.token1
          : token1 // ignore: cast_nullable_to_non_nullable
              as AEToken,
      token2: null == token2
          ? _value.token2
          : token2 // ignore: cast_nullable_to_non_nullable
              as AEToken,
    ) as $Val);
  }

  /// Create a copy of AETokenPair
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AETokenCopyWith<$Res> get token1 {
    return $AETokenCopyWith<$Res>(_value.token1, (value) {
      return _then(_value.copyWith(token1: value) as $Val);
    });
  }

  /// Create a copy of AETokenPair
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AETokenCopyWith<$Res> get token2 {
    return $AETokenCopyWith<$Res>(_value.token2, (value) {
      return _then(_value.copyWith(token2: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AETokenPairImplCopyWith<$Res>
    implements $AETokenPairCopyWith<$Res> {
  factory _$$AETokenPairImplCopyWith(
          _$AETokenPairImpl value, $Res Function(_$AETokenPairImpl) then) =
      __$$AETokenPairImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@AETokenJsonConverter() AEToken token1,
      @AETokenJsonConverter() AEToken token2});

  @override
  $AETokenCopyWith<$Res> get token1;
  @override
  $AETokenCopyWith<$Res> get token2;
}

/// @nodoc
class __$$AETokenPairImplCopyWithImpl<$Res>
    extends _$AETokenPairCopyWithImpl<$Res, _$AETokenPairImpl>
    implements _$$AETokenPairImplCopyWith<$Res> {
  __$$AETokenPairImplCopyWithImpl(
      _$AETokenPairImpl _value, $Res Function(_$AETokenPairImpl) _then)
      : super(_value, _then);

  /// Create a copy of AETokenPair
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token1 = null,
    Object? token2 = null,
  }) {
    return _then(_$AETokenPairImpl(
      token1: null == token1
          ? _value.token1
          : token1 // ignore: cast_nullable_to_non_nullable
              as AEToken,
      token2: null == token2
          ? _value.token2
          : token2 // ignore: cast_nullable_to_non_nullable
              as AEToken,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AETokenPairImpl extends _AETokenPair {
  const _$AETokenPairImpl(
      {@AETokenJsonConverter() required this.token1,
      @AETokenJsonConverter() required this.token2})
      : super._();

  factory _$AETokenPairImpl.fromJson(Map<String, dynamic> json) =>
      _$$AETokenPairImplFromJson(json);

  @override
  @AETokenJsonConverter()
  final AEToken token1;
  @override
  @AETokenJsonConverter()
  final AEToken token2;

  @override
  String toString() {
    return 'AETokenPair(token1: $token1, token2: $token2)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AETokenPairImpl &&
            (identical(other.token1, token1) || other.token1 == token1) &&
            (identical(other.token2, token2) || other.token2 == token2));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token1, token2);

  /// Create a copy of AETokenPair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AETokenPairImplCopyWith<_$AETokenPairImpl> get copyWith =>
      __$$AETokenPairImplCopyWithImpl<_$AETokenPairImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AETokenPairImplToJson(
      this,
    );
  }
}

abstract class _AETokenPair extends AETokenPair {
  const factory _AETokenPair(
          {@AETokenJsonConverter() required final AEToken token1,
          @AETokenJsonConverter() required final AEToken token2}) =
      _$AETokenPairImpl;
  const _AETokenPair._() : super._();

  factory _AETokenPair.fromJson(Map<String, dynamic> json) =
      _$AETokenPairImpl.fromJson;

  @override
  @AETokenJsonConverter()
  AEToken get token1;
  @override
  @AETokenJsonConverter()
  AEToken get token2;

  /// Create a copy of AETokenPair
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AETokenPairImplCopyWith<_$AETokenPairImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
