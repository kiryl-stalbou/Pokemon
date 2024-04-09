import '../../../../shared/domain/entities/api_response.dart';
import '../entities/params/pokemons_long_params.dart';
import '../entities/params/pokemons_short_params.dart';
import '../entities/pokemon_long/pokemon_long_entity.dart';
import '../entities/pokemon_short/pokemon_short_entity.dart';

abstract interface class PokemonsInfoRepository {
  Future<ApiResponse<List<PokemonShortEntity>>> readPokemonsShort(PokemonsShortParams params);

  Future<ApiResponse<PokemonLongEntity>> readPokemonLong(PokemonLongParams params);
}
