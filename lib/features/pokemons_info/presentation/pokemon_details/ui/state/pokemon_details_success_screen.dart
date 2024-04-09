import 'package:flutter/material.dart';

import '../../../../domain/entities/pokemon_long/pokemon_long_entity.dart';

class PokemonDetailsSuccessScreen extends StatelessWidget {
  const PokemonDetailsSuccessScreen(this.pokemon, {super.key});

  final PokemonLongEntity pokemon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      children: [
        //
        AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            fit: BoxFit.fill,
            pokemon.frontImageUrl,
            filterQuality: FilterQuality.high,
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              Text(pokemon.name, style: textTheme.displaySmall),

              const SizedBox(height: 10),

              Text('Types: ${pokemon.types}', style: textTheme.titleMedium),

              const Divider(height: 40),

              Text('Weight: ${pokemon.weight} kg', style: textTheme.titleMedium),

              const SizedBox(height: 10),

              Text('Height: ${pokemon.height} cm', style: textTheme.titleMedium),
            ],
          ),
        ),
      ],
    );
  }
}
