import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../shared/domain/entities/api_exception.dart';
import '../../../../../shared/domain/entities/api_response.dart';
import '../../../domain/entities/params/pokemons_long_params.dart';
import '../../../domain/entities/params/pokemons_short_params.dart';
import '../../../domain/entities/pokemon_long/pokemon_long_entity.dart';
import '../../../domain/entities/pokemon_short/pokemon_short_entity.dart';
import 'pokemons_info_local_datasource.dart';

final class PokemonsInfoLocalDataSourceImpl implements PokemonsInfoLocalDataSource {
  const PokemonsInfoLocalDataSourceImpl(this._prefs);

  final SharedPreferences _prefs;

  static const _longKey = 'poklong';
  static const _shortKey = 'pokshort';

  @override
  Future<ApiResponse<PokemonLongEntity>> readPokemonLong(PokemonLongParams params) async {
    try {
      final string = _prefs.getString('$_longKey/${params.id}');

      if (string == null) return ApiResponse(exception: ApiException());

      final json = jsonDecode(string) as Map<String, dynamic>?;

      if (json != null) {
        final long = PokemonLongEntity.fromJson(json);

        return ApiResponse(data: long);
      }

      return ApiResponse(exception: ApiException());
    } on Exception catch (e, s) {
      log('$e, $s');

      return ApiResponse(exception: ApiException());
    }
  }

  @override
  Future<ApiResponse<List<PokemonShortEntity>>> readPokemonsShort(PokemonsShortParams params) async {
    try {
      final shorts = <PokemonShortEntity>[];

      for (var id = params.offset + 1; id <= params.offset + params.limit; id++) {
        final string = _prefs.getString('$_shortKey/$id');

        if (string == null) return ApiResponse(exception: ApiException());

        final json = jsonDecode(string) as Map<String, dynamic>?;

        if (json == null) return ApiResponse(exception: ApiException());

        final short = PokemonShortEntity.fromJson(json);

        shorts.add(short);
      }

      return ApiResponse(data: shorts);
    } on Exception catch (e, s) {
      log('$e, $s');

      return ApiResponse(exception: ApiException());
    }
  }

  @override
  Future<ApiResponse<void>> writePokemonLong(PokemonLongEntity long) async {
    try {
      final string = jsonEncode(long);

      await _prefs.setString('$_longKey/${long.id}', string);

      return const ApiResponse();
    } on Exception catch (e, s) {
      log('$e, $s');

      return ApiResponse(exception: ApiException());
    }
  }

  @override
  Future<ApiResponse<void>> writePokemonsShort(List<PokemonShortEntity> shorts) async {
    try {
      for (final short in shorts) {
        final string = jsonEncode(short);

        await _prefs.setString('$_shortKey/${short.id}', string);
      }

      return const ApiResponse();
    } on Exception catch (e, s) {
      log('$e, $s');

      return ApiResponse(exception: ApiException());
    }
  }
}
