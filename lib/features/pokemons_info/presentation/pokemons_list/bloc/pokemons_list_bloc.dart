import 'package:bloc/bloc.dart';

import '../../../domain/entities/params/pokemons_short_params.dart';
import '../../../domain/usecases/read_pokemons_short_usercase.dart';
import 'pokemons_list_event.dart';
import 'pokemons_list_pagination_state.dart';
import 'pokemons_list_state.dart';

class PokemonsListBloc extends Bloc<PokemonsListEvent, PokemonsListState> {
  PokemonsListBloc(this._readPokemonsShortUseCase) : super(const PokemonsListLoading()) {
    on<PokemonsListFetch>(_onFetch);
    on<PokemonsListScroll>(_onScroll);
  }

  final ReadPokemonsShortUseCase _readPokemonsShortUseCase;

  Future<void> _onFetch(PokemonsListFetch event, Emitter<PokemonsListState> emitter) async {
    final state = this.state;

    // Initial part

    if (state is! PokemonsListSuccess) {
      emitter(const PokemonsListLoading());

      final response = await _readPokemonsShortUseCase.invoke(const PokemonsShortParams(offset: 0, limit: 20));

      final pokemons = response.data;

      if (pokemons != null) {
        emitter(
          PokemonsListSuccess(
            pokemons,
            PokemonsListPaginationSuccess(hasReachedMax: pokemons.isEmpty),
          ),
        );

        return;
      }

      emitter(const PokemonsListFailure());

      return;
    }

    // Pagination part

    emitter(state.copyWith(paginationState: const PokemonsListPaginationLoading()));

    final response = await _readPokemonsShortUseCase.invoke(PokemonsShortParams(offset: state.pokemons.length, limit: 20));

    final pokemons = response.data;

    if (pokemons != null) {
      emitter(
        state.copyWith(
          pokemons: state.pokemons..addAll(pokemons),
          paginationState: PokemonsListPaginationSuccess(hasReachedMax: pokemons.isEmpty),
        ),
      );

      return;
    }

    emitter(state.copyWith(paginationState: const PokemonsListPaginationFailure()));
  }

  Future<void> _onScroll(PokemonsListScroll event, Emitter<PokemonsListState> emitter) async {
    final state = this.state;

    if (state is! PokemonsListSuccess) return;

    final paginationState = state.paginationState;

    if (paginationState is PokemonsListPaginationLoading) return;
    if (paginationState is PokemonsListPaginationFailure) return;
    if (paginationState is PokemonsListPaginationSuccess && paginationState.hasReachedMax) return;

    if (event.offset >= (event.maxOffset * 0.9)) add(const PokemonsListFetch());
  }
}
