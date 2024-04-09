import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/pokemons_info/data/datasources/local/pokemons_info_local_datasource_impl.dart';
import '../../features/pokemons_info/data/datasources/remote/pokemons_info_remote_datasource_impl.dart';
import '../../features/pokemons_info/data/repositories/pokemons_info_repository_impl.dart';
import '../../features/pokemons_info/domain/usecases/read_pokemon_long_usecase.dart';
import '../../features/pokemons_info/domain/usecases/read_pokemons_short_usercase.dart';

final locator = GetIt.I;

Future<void> configureDependencies() async {
  final remoteDataSource = PokemonsInfoRemoteDataSourceImpl(Dio());
  final localDataSource = PokemonsInfoLocalDataSourceImpl(await SharedPreferences.getInstance());

  final pokemonsInfoRepository = PokemonsInfoRepositoryImpl(remoteDataSource, localDataSource);
  final readPokemonLongUseCase = ReadPokemonLongUseCase(pokemonsInfoRepository);
  final readPokemonsShortUseCase = ReadPokemonsShortUseCase(pokemonsInfoRepository);

  locator.registerSingleton<ReadPokemonLongUseCase>(readPokemonLongUseCase);
  locator.registerSingleton<ReadPokemonsShortUseCase>(readPokemonsShortUseCase);
}
