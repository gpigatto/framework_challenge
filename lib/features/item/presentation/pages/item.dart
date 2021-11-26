import 'package:flutter/material.dart';
import 'package:framework_challenge/shared/widgets/button.dart';
import 'package:framework_challenge/shared/widgets/header.dart';
import 'package:framework_challenge/features/item/presentation/widgets/item_image.dart';
import 'package:framework_challenge/features/item/presentation/widgets/item_information.dart';
import 'package:framework_challenge/shared/png_images.dart';
import 'package:framework_challenge/shared/widgets/body.dart';
import 'package:framework_challenge/shared/widgets/space.dart';

class Item extends StatelessWidget {
  const Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _crossAlign = CrossAxisAlignment.stretch;

    return Body(
      child: Column(
        crossAxisAlignment: _crossAlign,
        children: [
          const VSpace(16),
          const Header(),
          const VSpace(8),
          const ItemImage(
            imagePath: PngImages.apple,
            heroTag: 'abc',
          ),
          const VSpace(16),
          const ItemInformation(
            name: 'Maçã',
            quantity: 1,
            value: 1.42,
          ),
          const VSpace(16),
          const Divider(
            height: 2,
          ),
          const VSpace(16),
          _titleCuriosity('Curiosidade'),
          const VSpace(8),
          _curiosity(
            'omnis laudantium Nulla rerum quaerat commodi amet officiis. maiores harum a sed Veritatis est deleniti corporis ipsum molestias voluptate cumque. Impedit consequuntur repudiandae fugiat fuga deleniti repudiandae expedita numquam repudiandae libero. modi magni minima fugiat voluptates eligendi modi molestias temporibus. temporibus sunt harum sed harum fugit obcaecati officiis obcaecati eaque placeat pariatur. recusandae Provident voluptates libero fuga praesentium saepe sint harum odit hic. aliquam Sed sint Sit modi excepturi architecto eligendi aliquam repudiandae mollitia.',
          ),
          const VSpace(16),
          const StretchButton(
            text: 'Adicionar ao Carrinho',
          ),
          const VSpace(16),
        ],
      ),
    );
  }

  _titleCuriosity(text) {
    const _size = 22.0;
    const _weight = FontWeight.w600;

    return Text(
      text,
      style: const TextStyle(
        fontSize: _size,
        fontWeight: _weight,
      ),
    );
  }

  _curiosity(text) {
    const _size = 16.0;

    return Expanded(
      child: SizedBox(
        child: SingleChildScrollView(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: _size,
            ),
          ),
        ),
      ),
    );
  }
}
