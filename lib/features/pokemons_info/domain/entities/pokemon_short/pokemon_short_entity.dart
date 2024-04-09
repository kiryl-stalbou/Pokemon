// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_short_entity.freezed.dart';

part 'pokemon_short_entity.g.dart';

@Freezed(fromJson: true, toJson: true)
class PokemonShortEntity with _$PokemonShortEntity {
  const factory PokemonShortEntity({
    required String name,
    required String id,
  }) = _PokemonShortEntity;

  factory PokemonShortEntity.fromJson(Map<String, Object?> json) => _$PokemonShortEntityFromJson(json);
}
