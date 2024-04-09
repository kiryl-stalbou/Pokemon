import 'package:bloc/bloc.dart';

import '../../../domain/entities/params/pokemons_long_params.dart';
import '../../../domain/usecases/read_pokemon_long_usecase.dart';
import 'pokemon_details_event.dart';
import 'pokemon_details_state.dart';

class PokemonDetailsBloc extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  PokemonDetailsBloc(this._pokemonId, this._readPokemonLongUseCase) : super(const PokemonDetailsLoading()) {
    on<PokemonDetailsFetch>(_onFetch);
  }

  final String _pokemonId;
  final ReadPokemonLongUseCase _readPokemonLongUseCase;

  Future<void> _onFetch(PokemonDetailsEvent event, Emitter<PokemonDetailsState> emitter) async {
    if (state is PokemonDetailsSuccess) return;

    emitter(const PokemonDetailsLoading());

    final response = await _readPokemonLongUseCase.invoke(PokemonLongParams(id: _pokemonId));

    final pokemon = response.data;

    if (pokemon != null) {
      emitter(PokemonDetailsSuccess(pokemon));

      return;
    }

    emitter(const PokemonDetailsFailure());
  }
}
