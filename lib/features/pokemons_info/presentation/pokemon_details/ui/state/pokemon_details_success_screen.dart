import 'package:flutter/material.dart';

import '../../../../domain/entities/pokemon_long/pokemon_long_entity.dart';
import '../../../../domain/entities/pokemon_short/pokemon_short_entity.dart';

class PokemonDetailsSuccessScreen extends StatelessWidget {
  const PokemonDetailsSuccessScreen(this.long, this.short, {super.key});

  final PokemonLongEntity long;
  final PokemonShortEntity short;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      children: [
        //
        AspectRatio(
          aspectRatio: 1,
          child: Image.network(long.frontImageUrl),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              Text(short.name, style: textTheme.displaySmall),

              const SizedBox(height: 10),

              Text('Types: ${long.types}', style: textTheme.titleMedium),

              const Divider(height: 40),

              Text('Weight: ${long.weight} kg', style: textTheme.titleMedium),

              const SizedBox(height: 10),

              Text('Height: ${long.height} cm', style: textTheme.titleMedium),
            ],
          ),
        ),
      ],
    );
  }
}
