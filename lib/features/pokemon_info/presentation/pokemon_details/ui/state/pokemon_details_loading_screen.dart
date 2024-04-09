import 'package:flutter/material.dart';

class PokemonDetailsLoadingScreen extends StatelessWidget {
  const PokemonDetailsLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}
