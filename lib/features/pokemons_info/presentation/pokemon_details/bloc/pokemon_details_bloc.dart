import 'package:bloc/bloc.dart';

import '../../../domain/entities/pokemon_long/pokemon_long_entity.dart';
import '../../../domain/entities/pokemon_short/pokemon_short_entity.dart';
import 'pokemon_details_event.dart';
import 'pokemon_details_state.dart';

class PokemonDetailsBloc extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  PokemonDetailsBloc(this.pokemonId) : super(const PokemonDetailsLoading()) {
    on<PokemonDetailsFetch>(_onFetch);
  }

  final String pokemonId;

  Future<void> _onFetch(PokemonDetailsEvent event, Emitter<PokemonDetailsState> emitter) async {
    if (state is! PokemonDetailsSuccess) {
      emitter(const PokemonDetailsLoading());

      await Future<void>.delayed(const Duration(seconds: 1));

      emitter(
        PokemonDetailsSuccess(
          PokemonLongEntity(id: pokemonId, frontImageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png', weight: 65, height: 56, types: ['types']),
          PokemonShortEntity(name: 'Meow', id: 'id'),
        ),
      );
    }
  }
}
