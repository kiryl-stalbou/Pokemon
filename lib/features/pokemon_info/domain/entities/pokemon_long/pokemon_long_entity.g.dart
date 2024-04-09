// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_long_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonLongEntityImpl _$$PokemonLongEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonLongEntityImpl(
      id: json['id'] as String,
      weight: json['weight'] as num,
      height: json['height'] as num,
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      frontImageUrl: json['frontImageUrl'] as String,
    );

Map<String, dynamic> _$$PokemonLongEntityImplToJson(
        _$PokemonLongEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weight': instance.weight,
      'height': instance.height,
      'types': instance.types,
      'frontImageUrl': instance.frontImageUrl,
    };
