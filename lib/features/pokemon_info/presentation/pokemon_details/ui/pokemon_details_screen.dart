import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pokemon_details_bloc.dart';
import '../bloc/pokemon_details_event.dart';
import '../bloc/pokemon_details_state.dart';
import 'state/pokemon_details_failure_screen.dart';
import 'state/pokemon_details_loading_screen.dart';
import 'state/pokemon_details_success_screen.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen(this.id, {super.key});

  final String id;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => PokemonDetailsBloc(id)..add(const PokemonDetailsFetch()),
        child: Scaffold(
          appBar: AppBar(title: Text('Pokemon: $id')),
          body: BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
            builder: (_, state) => switch (state) {
              PokemonDetailsLoading() => const PokemonDetailsLoadingScreen(),
              PokemonDetailsFailure() => const PokemonDetailsFailureScreen(),
              PokemonDetailsSuccess(:final long, :final short) => PokemonDetailsSuccessScreen(long, short),
            },
          ),
        ),
      );
}
