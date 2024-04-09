import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../../shared/domain/entities/api_exception.dart';
import '../../../../../shared/domain/entities/api_response.dart';
import '../../../domain/entities/params/pokemons_long_params.dart';
import '../../../domain/entities/params/pokemons_short_params.dart';
import '../../../domain/entities/pokemon_long/pokemon_long_entity.dart';
import '../../../domain/entities/pokemon_short/pokemon_short_entity.dart';
import 'pokemons_info_remote_datasource.dart';

final class PokemonsInfoRemoteDataSourceImpl implements PokemonsInfoRemoteDataSource {
  const PokemonsInfoRemoteDataSourceImpl(this._dio);

  final Dio _dio;
  static const _path = 'https://pokeapi.co/api/v2/pokemon';

  @override
  Future<ApiResponse<PokemonLongEntity>> readPokemonLong(PokemonLongParams params) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('$_path/${params.id}');

      if (response.statusCode == 200) {
        final json = response.data;

        if (json != null) {
          final long = PokemonLongEntity.fromJson(_formatLongJson(json));

          return ApiResponse(data: long);
        }
      }

      return ApiResponse(exception: ApiException());
    } on DioException catch (e, s) {
      log('$e, $s');

      return ApiResponse(exception: ApiException());
    }
  }

  @override
  Future<ApiResponse<List<PokemonShortEntity>>> readPokemonsShort(PokemonsShortParams params) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        _path,
        queryParameters: {'offset': params.offset, 'limit': params.limit},
      );

      if (response.statusCode == 200) {
        final jsons = response.data?['results'] as List<dynamic>?;

        if (jsons != null) {
          final shorts = <PokemonShortEntity>[];

          for (final json in jsons) {
            final short = PokemonShortEntity.fromJson(_formatShortJson(json as Map<String, dynamic>));

            shorts.add(short);
          }

          return ApiResponse(data: shorts);
        }
      }

      return ApiResponse(exception: ApiException());
    } on DioException catch (e, s) {
      log('$e, $s');

      return ApiResponse(exception: ApiException());
    }
  }

  Map<String, Object?> _formatShortJson(Map<String, dynamic> json) {
    final segments = (json['url'] as String).split('/');
    final id = segments[segments.length - 2];

    return {
      'id': id,
      'name': json['name'],
    };
  }

  Map<String, Object?> _formatLongJson(Map<String, dynamic> json) {
    final sprites = json['sprites'] as Map<String, dynamic>;

    final types = (json['types'] as List<dynamic>).map((e) {
      final data = e as Map<String, dynamic>;
      final type = data['type'] as Map<String, dynamic>;
      return type['name'] as String;
    }).toList();

    return {
      'id': (json['id'] as num).toString(),
      'types': types,
      'name': json['name'] as String,
      'weight': json['weight'] as num,
      'height': json['height'] as num,
      'frontImageUrl': sprites['front_default'] as String,
    };
  }
}
