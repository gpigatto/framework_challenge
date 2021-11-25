import 'package:flutter/material.dart';
import 'package:framework_challenge/features/item/presentation/widgets/item_header.dart';
import 'package:framework_challenge/features/item/presentation/widgets/item_image.dart';
import 'package:framework_challenge/features/item/presentation/widgets/item_information.dart';
import 'package:framework_challenge/shared/png_images.dart';
import 'package:framework_challenge/shared/widgets/space.dart';

class Item extends StatelessWidget {
  const Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _padding = 16.0;
    const _crossAlign = CrossAxisAlignment.stretch;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: _padding),
          child: Column(
            crossAxisAlignment: _crossAlign,
            children: [
              const VSpace(16),
              const ItemHeader(),
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
              _addToCart(),
              const VSpace(16),
            ],
          ),
        ),
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

  _addToCart() {
    const _padding = 14.0;
    const _radius = 14.0;

    const _color = Colors.green;

    const _size = 22.0;
    const _weight = FontWeight.w600;
    const _textColor = Colors.white;

    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(_radius)),
        color: _color,
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(_radius)),
        onTap: () => {},
        child: const Padding(
          padding: EdgeInsets.all(_padding),
          child: Center(
            child: Text(
              'Adicionar ao Carrinho',
              style: TextStyle(
                fontSize: _size,
                fontWeight: _weight,
                color: _textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
