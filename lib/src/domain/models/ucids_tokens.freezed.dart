// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ucids_tokens.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UcidsTokens _$UcidsTokensFromJson(Map<String, dynamic> json) {
  return _UcidsTokens.fromJson(json);
}

/// @nodoc
mixin _$UcidsTokens {
  /// A map of cryptocurrency names to their UCIDs on the Mainnet.
  Map<String, int> get mainnet => throw _privateConstructorUsedError;

  /// A map of cryptocurrency names to their UCIDs on the Testnet.
  Map<String, int> get testnet => throw _privateConstructorUsedError;

  /// A map of cryptocurrency names to their UCIDs on the Devnet.
  Map<String, int> get devnet => throw _privateConstructorUsedError;

  /// Serializes this UcidsTokens to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UcidsTokens
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UcidsTokensCopyWith<UcidsTokens> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UcidsTokensCopyWith<$Res> {
  factory $UcidsTokensCopyWith(
          UcidsTokens value, $Res Function(UcidsTokens) then) =
      _$UcidsTokensCopyWithImpl<$Res, UcidsTokens>;
  @useResult
  $Res call(
      {Map<String, int> mainnet,
      Map<String, int> testnet,
      Map<String, int> devnet});
}

/// @nodoc
class _$UcidsTokensCopyWithImpl<$Res, $Val extends UcidsTokens>
    implements $UcidsTokensCopyWith<$Res> {
  _$UcidsTokensCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UcidsTokens
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainnet = null,
    Object? testnet = null,
    Object? devnet = null,
  }) {
    return _then(_value.copyWith(
      mainnet: null == mainnet
          ? _value.mainnet
          : mainnet // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      testnet: null == testnet
          ? _value.testnet
          : testnet // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      devnet: null == devnet
          ? _value.devnet
          : devnet // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UcidsTokensImplCopyWith<$Res>
    implements $UcidsTokensCopyWith<$Res> {
  factory _$$UcidsTokensImplCopyWith(
          _$UcidsTokensImpl value, $Res Function(_$UcidsTokensImpl) then) =
      __$$UcidsTokensImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, int> mainnet,
      Map<String, int> testnet,
      Map<String, int> devnet});
}

/// @nodoc
class __$$UcidsTokensImplCopyWithImpl<$Res>
    extends _$UcidsTokensCopyWithImpl<$Res, _$UcidsTokensImpl>
    implements _$$UcidsTokensImplCopyWith<$Res> {
  __$$UcidsTokensImplCopyWithImpl(
      _$UcidsTokensImpl _value, $Res Function(_$UcidsTokensImpl) _then)
      : super(_value, _then);

  /// Create a copy of UcidsTokens
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainnet = null,
    Object? testnet = null,
    Object? devnet = null,
  }) {
    return _then(_$UcidsTokensImpl(
      mainnet: null == mainnet
          ? _value._mainnet
          : mainnet // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      testnet: null == testnet
          ? _value._testnet
          : testnet // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      devnet: null == devnet
          ? _value._devnet
          : devnet // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UcidsTokensImpl implements _UcidsTokens {
  const _$UcidsTokensImpl(
      {required final Map<String, int> mainnet,
      required final Map<String, int> testnet,
      required final Map<String, int> devnet})
      : _mainnet = mainnet,
        _testnet = testnet,
        _devnet = devnet;

  factory _$UcidsTokensImpl.fromJson(Map<String, dynamic> json) =>
      _$$UcidsTokensImplFromJson(json);

  /// A map of cryptocurrency names to their UCIDs on the Mainnet.
  final Map<String, int> _mainnet;

  /// A map of cryptocurrency names to their UCIDs on the Mainnet.
  @override
  Map<String, int> get mainnet {
    if (_mainnet is EqualUnmodifiableMapView) return _mainnet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_mainnet);
  }

  /// A map of cryptocurrency names to their UCIDs on the Testnet.
  final Map<String, int> _testnet;

  /// A map of cryptocurrency names to their UCIDs on the Testnet.
  @override
  Map<String, int> get testnet {
    if (_testnet is EqualUnmodifiableMapView) return _testnet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_testnet);
  }

  /// A map of cryptocurrency names to their UCIDs on the Devnet.
  final Map<String, int> _devnet;

  /// A map of cryptocurrency names to their UCIDs on the Devnet.
  @override
  Map<String, int> get devnet {
    if (_devnet is EqualUnmodifiableMapView) return _devnet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_devnet);
  }

  @override
  String toString() {
    return 'UcidsTokens(mainnet: $mainnet, testnet: $testnet, devnet: $devnet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UcidsTokensImpl &&
            const DeepCollectionEquality().equals(other._mainnet, _mainnet) &&
            const DeepCollectionEquality().equals(other._testnet, _testnet) &&
            const DeepCollectionEquality().equals(other._devnet, _devnet));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_mainnet),
      const DeepCollectionEquality().hash(_testnet),
      const DeepCollectionEquality().hash(_devnet));

  /// Create a copy of UcidsTokens
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UcidsTokensImplCopyWith<_$UcidsTokensImpl> get copyWith =>
      __$$UcidsTokensImplCopyWithImpl<_$UcidsTokensImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UcidsTokensImplToJson(
      this,
    );
  }
}

abstract class _UcidsTokens implements UcidsTokens {
  const factory _UcidsTokens(
      {required final Map<String, int> mainnet,
      required final Map<String, int> testnet,
      required final Map<String, int> devnet}) = _$UcidsTokensImpl;

  factory _UcidsTokens.fromJson(Map<String, dynamic> json) =
      _$UcidsTokensImpl.fromJson;

  /// A map of cryptocurrency names to their UCIDs on the Mainnet.
  @override
  Map<String, int> get mainnet;

  /// A map of cryptocurrency names to their UCIDs on the Testnet.
  @override
  Map<String, int> get testnet;

  /// A map of cryptocurrency names to their UCIDs on the Devnet.
  @override
  Map<String, int> get devnet;

  /// Create a copy of UcidsTokens
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UcidsTokensImplCopyWith<_$UcidsTokensImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
