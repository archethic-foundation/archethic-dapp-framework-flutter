// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ae_token_pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AETokenPairImpl _$$AETokenPairImplFromJson(Map<String, dynamic> json) =>
    _$AETokenPairImpl(
      token1: const AETokenJsonConverter()
          .fromJson(json['token1'] as Map<String, dynamic>),
      token2: const AETokenJsonConverter()
          .fromJson(json['token2'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AETokenPairImplToJson(_$AETokenPairImpl instance) =>
    <String, dynamic>{
      'token1': const AETokenJsonConverter().toJson(instance.token1),
      'token2': const AETokenJsonConverter().toJson(instance.token2),
    };
