import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entities/pokemon_short/pokemon_short_entity.dart';
import '../../bloc/pokemons_list_bloc.dart';
import '../../bloc/pokemons_list_event.dart';
import '../../bloc/pokemons_list_pagination_state.dart';

class PokemonsListSuccessScreen extends StatefulWidget {
  const PokemonsListSuccessScreen(this.pokemons, this.paginationState, {super.key});

  final List<PokemonShortEntity> pokemons;
  final PokemonsListPaginationState paginationState;

  @override
  State<PokemonsListSuccessScreen> createState() => _PokemonsListSuccessScreenState();
}

class _PokemonsListSuccessScreenState extends State<PokemonsListSuccessScreen> {
  late final _bloc = context.read<PokemonsListBloc>();
  final _controller = ScrollController();

  void _onScroll() => _bloc.add(
        PokemonsListScroll(
          _controller.offset,
          _controller.position.maxScrollExtent,
        ),
      );

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
        controller: _controller,
        slivers: [
          //
          SliverList.builder(
            itemBuilder: (_, index) => ListTile(
              title: Text(widget.pokemons[index].name),
              onTap: () => context.go('/pokemons/${widget.pokemons[index].id}'),
            ),
            itemCount: widget.pokemons.length,
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
              child: Center(
                child: switch (widget.paginationState) {
                  PokemonsListPaginationLoading() => const CircularProgressIndicator(),
                  PokemonsListPaginationFailure() => const _PaginationFailure(),
                  PokemonsListPaginationSuccess() => const SizedBox.shrink(),
                },
              ),
            ),
          ),
        ],
      );
}

class _PaginationFailure extends StatelessWidget {
  const _PaginationFailure();

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          //
          Text(
            'Failed to load more pokemons',
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () => context.read<PokemonsListBloc>().add(const PokemonsListFetch()),
            child: const Text('Reload'),
          ),
        ],
      );
}
