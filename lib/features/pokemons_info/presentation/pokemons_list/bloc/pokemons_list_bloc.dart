import 'package:bloc/bloc.dart';

import '../../../domain/entities/pokemon_short/pokemon_short_entity.dart';
import 'pokemons_list_event.dart';
import 'pokemons_list_pagination_state.dart';
import 'pokemons_list_state.dart';

class PokemonsListBloc extends Bloc<PokemonsListEvent, PokemonsListState> {
  PokemonsListBloc() : super(const PokemonsListLoading()) {
    on<PokemonsListFetch>(_onFetch);
    on<PokemonsListScroll>(_onScroll);
  }

  Future<void> _onFetch(PokemonsListFetch event, Emitter<PokemonsListState> emitter) async {
    final state = this.state;

    if (state is! PokemonsListSuccess) {
      emitter(const PokemonsListLoading());

      await Future<void>.delayed(const Duration(seconds: 1));

      emitter(
        PokemonsListSuccess(
          [
            const PokemonShortEntity(name: 'name', id: 'id'),
            const PokemonShortEntity(name: 'name', id: 'id'),
            const PokemonShortEntity(name: 'name', id: 'id'),
            const PokemonShortEntity(name: 'name', id: 'id'),
            const PokemonShortEntity(name: 'name', id: 'id'),
            const PokemonShortEntity(name: 'name', id: 'id'),
            const PokemonShortEntity(name: 'name', id: 'id'),
            const PokemonShortEntity(name: 'name', id: 'id'),
            const PokemonShortEntity(name: 'name', id: 'id'),
            const PokemonShortEntity(name: 'name', id: 'id'),
            const PokemonShortEntity(name: 'name', id: 'id'),
            const PokemonShortEntity(name: 'name', id: 'id'),
            const PokemonShortEntity(name: 'name', id: 'id'),
            const PokemonShortEntity(name: 'name', id: 'id'),
            const PokemonShortEntity(name: 'name', id: 'id'),
            const PokemonShortEntity(name: 'name', id: 'id'),
            const PokemonShortEntity(name: 'name', id: 'id'),
            const PokemonShortEntity(name: 'name', id: 'id'),
          ],
          PokemonsListPaginationSuccess(hasReachedMax: false),
        ),
      );

      return;
    }

    final paginationState = state.paginationState;

    if (paginationState is PokemonsListPaginationLoading) return;
    if (paginationState is PokemonsListPaginationSuccess && paginationState.hasReachedMax) return;

    emitter(state.copyWith(paginationState: const PokemonsListPaginationLoading()));

    await Future<void>.delayed(const Duration(seconds: 1));

    emitter(
      state.copyWith(
        pokemons: state.pokemons
          ..addAll(
            [
              const PokemonShortEntity(name: 'name', id: 'id'),
              const PokemonShortEntity(name: 'name', id: 'id'),
              const PokemonShortEntity(name: 'name', id: 'id'),
              const PokemonShortEntity(name: 'name', id: 'id'),
              const PokemonShortEntity(name: 'name', id: 'id'),
              const PokemonShortEntity(name: 'name', id: 'id'),
              const PokemonShortEntity(name: 'name', id: 'id'),
              const PokemonShortEntity(name: 'name', id: 'id'),
              const PokemonShortEntity(name: 'name', id: 'id'),
              const PokemonShortEntity(name: 'name', id: 'id'),
            ],
          ),
        paginationState: const PokemonsListPaginationSuccess(hasReachedMax: true),
      ),
    );
  }

  Future<void> _onScroll(PokemonsListScroll event, Emitter<PokemonsListState> emitter) async {
    final state = this.state;

    if (state is PokemonsListSuccess && state.paginationState is PokemonsListPaginationFailure) return;

    if (event.offset >= (event.maxOffset * 0.9)) add(const PokemonsListFetch());
  }
}
