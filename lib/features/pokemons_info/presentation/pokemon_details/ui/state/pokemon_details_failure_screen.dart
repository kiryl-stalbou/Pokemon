import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/pokemon_details_bloc.dart';
import '../../bloc/pokemon_details_event.dart';

class PokemonDetailsFailureScreen extends StatelessWidget {
  const PokemonDetailsFailureScreen({super.key});

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
              child: const Text('Reload'),
              onPressed: () => context.read<PokemonDetailsBloc>().add(const PokemonDetailsFetch()),
            ),
          ],
        ),
      );
}
