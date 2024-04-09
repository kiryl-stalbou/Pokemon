// ignore_for_file: cast_nullable_to_non_nullable, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_short_entity.freezed.dart';

part 'pokemon_short_entity.g.dart';

@Freezed(fromJson: false, toJson: true)
class PokemonShortEntity with _$PokemonShortEntity {
  const factory PokemonShortEntity({
    required String name,
    required String id,
  }) = _PokemonShortEntity;

  factory PokemonShortEntity.fromJson(Map<String, Object?> json) {
    final segments = (json['url'] as String).split('/');
    final id = segments[segments.length - 2];
    return PokemonShortEntity(name: json['name'] as String, id: id);
  }
}
