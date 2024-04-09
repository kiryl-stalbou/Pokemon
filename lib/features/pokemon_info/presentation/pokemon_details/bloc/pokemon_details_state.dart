import '../../../domain/entities/pokemon_long/pokemon_long_entity.dart';
import '../../../domain/entities/pokemon_short/pokemon_short_entity.dart';

sealed class PokemonDetailsState {
  const PokemonDetailsState();
}

final class PokemonDetailsLoading extends PokemonDetailsState {
  const PokemonDetailsLoading();
}

final class PokemonDetailsFailure extends PokemonDetailsState {
  const PokemonDetailsFailure();
}

final class PokemonDetailsSuccess extends PokemonDetailsState {
  const PokemonDetailsSuccess(this.long, this.short);

  final PokemonLongEntity long;
  final PokemonShortEntity short;
}
