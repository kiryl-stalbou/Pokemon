// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_long_entity.freezed.dart';

part 'pokemon_long_entity.g.dart';

@Freezed(fromJson: true, toJson: true)
class PokemonLongEntity with _$PokemonLongEntity {
  const factory PokemonLongEntity({
    required String id,
    required num weight,
    required num height,
    required String name,
    required List<String> types,
    required String frontImageUrl,
  }) = _PokemonLongEntity;

  factory PokemonLongEntity.fromJson(Map<String, Object?> json) => _$PokemonLongEntityFromJson(json);
}
