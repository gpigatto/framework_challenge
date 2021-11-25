import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  final String imagePath;
  final String heroTag;

  const ItemImage({Key? key, required this.imagePath, required this.heroTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _imageSize = 240.0;

    return Hero(
      tag: heroTag,
      child: Center(
        child: Image(
          height: _imageSize,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}
