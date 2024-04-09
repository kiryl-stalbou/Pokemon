import '../../../../shared/domain/entities/api_response.dart';
import '../../../../shared/domain/usecases/usecase.dart';
import '../entities/params/pokemons_long_params.dart';
import '../entities/pokemon_long/pokemon_long_entity.dart';
import '../repositories/pokemons_info_repository.dart';

final class ReadPokemonLongUseCase implements UseCase<PokemonLongEntity, PokemonLongParams> {
  const ReadPokemonLongUseCase(this._repository);

  final PokemonsInfoRepository _repository;

  @override
  Future<ApiResponse<PokemonLongEntity>> invoke(PokemonLongParams params) => _repository.readPokemonLong(params);
}
