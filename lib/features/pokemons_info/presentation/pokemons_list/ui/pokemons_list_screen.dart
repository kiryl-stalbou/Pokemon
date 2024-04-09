import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/locator.dart';
import '../../../domain/usecases/read_pokemons_short_usercase.dart';
import '../bloc/pokemons_list_bloc.dart';
import '../bloc/pokemons_list_event.dart';
import '../bloc/pokemons_list_state.dart';
import 'states/pokemons_list_failure_screen.dart';
import 'states/pokemons_list_loading_screen.dart';
import 'states/pokemons_list_success_screen.dart';

class PokemonsListScreen extends StatelessWidget {
  const PokemonsListScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => PokemonsListBloc(locator<ReadPokemonsShortUseCase>())..add(const PokemonsListFetch()),
        child: Scaffold(
          appBar: AppBar(title: const Text('Pokemons')),
          body: BlocBuilder<PokemonsListBloc, PokemonsListState>(
            builder: (context, state) => switch (state) {
              PokemonsListLoading() => const PokemonsListLoadingScreen(),
              PokemonsListFailure() => const PokemonsListFailureScreen(),
              PokemonsListSuccess(:final pokemons, :final paginationState) => PokemonsListSuccessScreen(pokemons, paginationState),
            },
          ),
        ),
      );
}
