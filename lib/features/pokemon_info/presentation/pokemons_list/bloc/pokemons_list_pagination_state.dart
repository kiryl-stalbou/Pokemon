sealed class PokemonsListPaginationState {
  const PokemonsListPaginationState();
}

final class PokemonsListPaginationLoading extends PokemonsListPaginationState {
  const PokemonsListPaginationLoading();
}

final class PokemonsListPaginationFailure extends PokemonsListPaginationState {
  const PokemonsListPaginationFailure();
}

final class PokemonsListPaginationSuccess extends PokemonsListPaginationState {
  const PokemonsListPaginationSuccess({required this.hasReachedMax});

  final bool hasReachedMax;
}
