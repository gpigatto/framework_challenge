import 'package:flutter/material.dart';
import 'package:framework_challenge/features/feed/presentation/widgets/fruit_card.dart';
import 'package:framework_challenge/features/item/presentation/pages/item.dart';
import 'package:framework_challenge/shared/png_images.dart';

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
            function: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Item(),
                ),
              );
            },
            imgPath: PngImages.apple,
            name: "Maçã",
            value: 12.0,
          ),
        ],
      ),
    );
  }
}
