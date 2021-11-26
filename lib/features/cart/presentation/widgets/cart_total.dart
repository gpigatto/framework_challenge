import 'package:flutter/material.dart';
import 'package:framework_challenge/shared/widgets/space.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _crossAlign = CrossAxisAlignment.stretch;

    return Column(
      crossAxisAlignment: _crossAlign,
      children: [
        _subTotal('test', 1),
        const VSpace(16),
        _subTotal('test', 1),
        const VSpace(16),
        _divider(),
        const VSpace(16),
        _total('Total', 1),
      ],
    );
  }

  Divider _divider() {
    const _thickness = 1.2;
    const _color = Colors.green;

    return const Divider(
      thickness: _thickness,
      color: _color,
    );
  }

  _subTotal(title, value) {
    const _weight = FontWeight.w600;
    const _size = 18.0;
    const _titleColor = Colors.black38;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: _weight,
            fontSize: _size,
            color: _titleColor,
          ),
        ),
        Text(
          "R\$${value.toStringAsFixed(2).replaceAll('.', ',')}",
          style: const TextStyle(
            fontWeight: _weight,
            fontSize: _size,
          ),
        ),
      ],
    );
  }

  _total(title, value) {
    const _weight = FontWeight.w600;
    const _size = 18.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: _weight,
            fontSize: _size,
          ),
        ),
        Text(
          "R\$${value.toStringAsFixed(2).replaceAll('.', ',')}",
          style: const TextStyle(
            fontWeight: _weight,
            fontSize: _size,
          ),
        ),
      ],
    );
  }
}
