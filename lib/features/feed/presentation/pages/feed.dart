import 'package:flutter/material.dart';
import 'package:framework_challenge/features/feed/presentation/widgets/fruit_list.dart';
import 'package:framework_challenge/features/feed/presentation/widgets/feed_header.dart';
import 'package:framework_challenge/shared/widgets/space.dart';

class Feed extends StatelessWidget {
  const Feed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        VSpace(16),
        FeedHeader(),
        VSpace(32),
        FruitList(),
      ],
    );
  }
}
