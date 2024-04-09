// ignore_for_file: cast_nullable_to_non_nullable, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_long_entity.freezed.dart';

part 'pokemon_long_entity.g.dart';

@Freezed(fromJson: false, toJson: true)
class PokemonLongEntity with _$PokemonLongEntity {
  const factory PokemonLongEntity({
    required String id,
    required num weight,
    required num height,
    required String name,
    required List<String> types,
    required String frontImageUrl,
  }) = _PokemonLongEntity;

  factory PokemonLongEntity.fromJson(Map<String, Object?> json) {
    final sprites = json['sprites'] as Map<String, dynamic>;

    final types = (json['types'] as List<dynamic>).map((e) {
      final data = e as Map<String, dynamic>;
      final type = data['type'] as Map<String, dynamic>;
      return type['name'] as String;
    }).toList();

    return PokemonLongEntity(
      types: types,
      name: json['name'] as String,
      weight: json['weight'] as num,
      height: json['height'] as num,
      id: (json['id'] as num).toString(),
      frontImageUrl: sprites['front_default'] as String,
    );
  }
}
