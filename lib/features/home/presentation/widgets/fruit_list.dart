import 'package:flutter/material.dart';
import 'package:framework_challenge/features/home/presentation/widgets/fruit_card.dart';
import 'package:framework_challenge/shared/png_images.dart';
import 'package:framework_challenge/shared/widgets/space.dart';

class FruitList extends StatelessWidget {
  const FruitList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        children: [
          FruitCard(
            function: () {},
            imgPath: PngImages.apple,
            name: "Maçã",
            value: 12.0,
          ),
          FruitCard(
            function: () {},
            imgPath: PngImages.apple,
            name: "Maçã",
            value: 12.0,
          ),
        ],
      ),
    );
  }
}
