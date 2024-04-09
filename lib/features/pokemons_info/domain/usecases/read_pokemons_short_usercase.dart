import '../../../../shared/domain/entities/api_response.dart';
import '../../../../shared/domain/usecases/usecase.dart';
import '../entities/params/pokemons_short_params.dart';
import '../entities/pokemon_short/pokemon_short_entity.dart';
import '../repositories/pokemons_info_repository.dart';

final class ReadPokemonsShortUseCase implements UseCase<List<PokemonShortEntity>, PokemonsShortParams> {
  const ReadPokemonsShortUseCase(this.repository);

  final PokemonsInfoRepository repository;

  @override
  Future<ApiResponse<List<PokemonShortEntity>>> invoke(PokemonsShortParams params) => repository.readPokemonsShort(params);
}
