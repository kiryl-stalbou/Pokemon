import '../../../../../shared/domain/entities/api_response.dart';
import '../../../domain/entities/params/pokemons_long_params.dart';
import '../../../domain/entities/params/pokemons_short_params.dart';
import '../../../domain/entities/pokemon_long/pokemon_long_entity.dart';
import '../../../domain/entities/pokemon_short/pokemon_short_entity.dart';

abstract interface class PokemonsInfoLocalDataSource {
  Future<ApiResponse<List<PokemonShortEntity>>> readPokemonsShort(PokemonsShortParams params);

  Future<ApiResponse<PokemonLongEntity>> readPokemonsLong(PokemonLongParams params);

  Future<ApiResponse<void>> writePokemonsShort(List<PokemonShortEntity> pokemonsShort);

  Future<ApiResponse<void>> writePokemonLong(PokemonLongEntity pokemonLong);
}
