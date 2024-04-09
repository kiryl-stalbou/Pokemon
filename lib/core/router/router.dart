import 'package:go_router/go_router.dart';

import '../../features/pokemons_info/presentation/pokemon_details/ui/pokemon_details_screen.dart';
import '../../features/pokemons_info/presentation/pokemons_list/ui/pokemons_list_screen.dart';

final router = GoRouter(
  initialLocation: '/pokemons',
  routes: [
    GoRoute(
      path: '/pokemons',
      builder: (_, __) => const PokemonsListScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (_, state) => PokemonDetailsScreen(state.pathParameters['id'] ?? ''),
        ),
      ],
    ),
  ],
);
