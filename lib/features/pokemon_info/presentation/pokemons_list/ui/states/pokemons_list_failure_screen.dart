import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/pokemons_list_bloc.dart';
import '../../bloc/pokemons_list_event.dart';

class PokemonsListFailureScreen extends StatelessWidget {
  const PokemonsListFailureScreen({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            //
            Text(
              'Something unexpected happened 🙃',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 10),

            const Text('Please check your internet connection and try again'),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () => context.read<PokemonsListBloc>().add(const PokemonsListFetch()),
              child: const Text('Reload'),
            ),
          ],
        ),
      );
}
