import '../../../domain/entities/pokemon_short/pokemon_short_entity.dart';
import 'pokemons_list_pagination_state.dart';

sealed class PokemonsListState {
  const PokemonsListState();
}

final class PokemonsListLoading extends PokemonsListState {
  const PokemonsListLoading();
}

final class PokemonsListFailure extends PokemonsListState {
  const PokemonsListFailure();
}

final class PokemonsListSuccess extends PokemonsListState {
  const PokemonsListSuccess(this.pokemons, this.paginationState);

  final List<PokemonShortEntity> pokemons;
  final PokemonsListPaginationState paginationState;

  PokemonsListSuccess copyWith({
    List<PokemonShortEntity>? pokemons,
    PokemonsListPaginationState? paginationState,
  }) =>
      PokemonsListSuccess(
        pokemons ?? this.pokemons,
        paginationState ?? this.paginationState,
      );
}
