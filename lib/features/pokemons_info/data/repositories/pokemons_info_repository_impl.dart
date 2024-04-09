import '../../../../shared/domain/entities/api_response.dart';
import '../../domain/entities/params/pokemons_long_params.dart';
import '../../domain/entities/params/pokemons_short_params.dart';
import '../../domain/entities/pokemon_long/pokemon_long_entity.dart';
import '../../domain/entities/pokemon_short/pokemon_short_entity.dart';
import '../../domain/repositories/pokemons_info_repository.dart';
import '../datasources/local/pokemons_info_local_datasource.dart';
import '../datasources/remote/pokemons_info_remote_datasource.dart';

final class PokemonsInfoRepositoryImpl implements PokemonsInfoRepository {
  const PokemonsInfoRepositoryImpl(this._remote, this._local);

  final PokemonsInfoRemoteDataSource _remote;
  final PokemonsInfoLocalDataSource _local;

  @override
  Future<ApiResponse<PokemonLongEntity>> readPokemonLong(PokemonLongParams params) async {
    final localResponse = await _local.readPokemonsLong(params);

    if (localResponse is ApiSuccess) return localResponse;

    final remoteResponse = await _remote.readPokemonLong(params);

    if (remoteResponse is ApiSuccess) {
      await _local.writePokemonLong(remoteResponse.data);

      return remoteResponse;
    }

    return remoteResponse;
  }

  @override
  Future<ApiResponse<List<PokemonShortEntity>>> readPokemonsShort(PokemonsShortParams params) async {
    final localResponse = await _local.readPokemonsShort(params);

    if (localResponse is ApiSuccess) return localResponse;

    final remoteResponse = await _remote.readPokemonsShort(params);

    if (remoteResponse is ApiSuccess) {
      await _local.writePokemonsShort(remoteResponse.data);

      return remoteResponse;
    }

    return remoteResponse;
  }
}
