import 'package:flutter/material.dart';

class PokemonsListLoadingScreen extends StatelessWidget {
  const PokemonsListLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) => const Center(
      child: CircularProgressIndicator(),
    );
}
