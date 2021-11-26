import 'package:flutter/material.dart';
import 'package:framework_challenge/shared/png_images.dart';
import 'package:framework_challenge/shared/widgets/space.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _image(),
              const HSpace(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _name("Maçã"),
                  _value("R\$12,00"),
                ],
              ),
            ],
          ),
          _productQuantity(),
        ],
      ),
    );
  }

  _image() {
    const _maxWidth = 64.0;

    return Container(
      constraints: const BoxConstraints(maxWidth: _maxWidth),
      child: const Center(
        child: Image(
          image: AssetImage(PngImages.apple),
        ),
      ),
    );
  }

  _name(text) {
    const _weight = FontWeight.w600;
    const _size = 18.0;

    return Text(
      text,
      style: const TextStyle(
        fontWeight: _weight,
        fontSize: _size,
      ),
    );
  }

  _value(text) {
    const _weight = FontWeight.w700;
    const _size = 16.0;

    const _color = Colors.green;

    return Text(
      text,
      style: const TextStyle(
        fontWeight: _weight,
        fontSize: _size,
        color: _color,
      ),
    );
  }

  _productQuantity() {
    return Row(
      children: [
        _button(Icons.remove),
        const HSpace(16),
        Column(
          children: [
            _quantity(2),
            _leadingTextValue('kg'),
          ],
        ),
        const HSpace(16),
        _button(Icons.add),
      ],
    );
  }

  _button(icon) {
    const _padding = 4.0;
    const _radius = 10.0;

    const _color = Colors.green;
    const _iconColor = Colors.white;

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(_radius)),
        color: _color,
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(_radius)),
        onTap: () => {},
        child: Padding(
          padding: const EdgeInsets.all(_padding),
          child: Icon(
            icon,
            color: _iconColor,
            size: 22,
          ),
        ),
      ),
    );
  }

  _quantity(value) {
    const _weight = FontWeight.w800;
    const _size = 22.0;

    const _color = Colors.black;

    return Text(
      value.toString(),
      style: const TextStyle(
        fontWeight: _weight,
        fontSize: _size,
        color: _color,
      ),
    );
  }

  _leadingTextValue(text) {
    const _size = 12.0;
    const _color = Colors.black26;

    return Text(
      text,
      style: const TextStyle(
        fontSize: _size,
        color: _color,
      ),
    );
  }
}
