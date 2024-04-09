import '../../../../../shared/domain/entities/api_response.dart';
import '../../../domain/entities/params/pokemons_long_params.dart';
import '../../../domain/entities/params/pokemons_short_params.dart';
import '../../../domain/entities/pokemon_long/pokemon_long_entity.dart';
import '../../../domain/entities/pokemon_short/pokemon_short_entity.dart';

abstract interface class PokemonsInfoRemoteDataSource {
  Future<ApiResponse<List<PokemonShortEntity>>> readPokemonsShort(PokemonsShortParams params);

  Future<ApiResponse<PokemonLongEntity>> readPokemonLong(PokemonLongParams params);
}
