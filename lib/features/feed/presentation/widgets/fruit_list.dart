import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:framework_challenge/core/infrastructure/service_locator.dart';
import 'package:framework_challenge/features/feed/presentation/bloc/feed_bloc.dart';
import 'package:framework_challenge/features/feed/presentation/widgets/fruit_card.dart';
import 'package:framework_challenge/features/item/presentation/pages/item.dart';

class FruitList extends StatelessWidget {
  const FruitList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeedBloc>(
      create: (_) => FeedBloc(serviceLocator()),
      child: const _FruitList(),
    );
  }
}

class _FruitList extends StatefulWidget {
  const _FruitList({
    Key? key,
  }) : super(key: key);

  @override
  State<_FruitList> createState() => _FruitListState();
}

class _FruitListState extends State<_FruitList> {
  @override
  void initState() {
    context.read<FeedBloc>().add(FeedLoad());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const _spacing = 8.0;
    const _grid = 2;

    return BlocBuilder<FeedBloc, FeedState>(
      builder: (context, state) {
        if (state is FeedLoaded) {
          return Expanded(
            child: GridView.count(
              crossAxisCount: _grid,
              mainAxisSpacing: _spacing,
              crossAxisSpacing: _spacing,
              children: state.feed.list!.map((item) {
                return FruitCard(
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Item(
                          id: item!.id!,
                          imgPath: item.imagePath!,
                          name: item.name!,
                          value: item.value!,
                          curiosity: item.curiosity!,
                        ),
                      ),
                    );
                  },
                  imgPath: item!.imagePath!,
                  name: item.name!,
                  value: item.value!,
                  tag: item.id.toString(),
                );
              }).toList(),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
