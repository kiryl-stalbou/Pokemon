sealed class PokemonsListEvent {
  const PokemonsListEvent();
}

final class PokemonsListFetch extends PokemonsListEvent {
  const PokemonsListFetch();
}

final class PokemonsListScroll extends PokemonsListEvent {
  const PokemonsListScroll(this.offset, this.maxOffset);

  final double offset;
  final double maxOffset;
}
