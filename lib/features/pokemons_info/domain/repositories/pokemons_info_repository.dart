import '../../../../shared/domain/entities/api_response.dart';
import '../entities/pokemon_long/pokemon_long_entity.dart';
import '../entities/pokemon_short/pokemon_short_entity.dart';

abstract interface class PokemonsInfoRepository {
  Future<ApiResponse<List<PokemonShortEntity>>> readPokemonsShort(int offset, int limit);

  Future<ApiResponse<PokemonLongEntity>> readPokemonLong(String id);
}
