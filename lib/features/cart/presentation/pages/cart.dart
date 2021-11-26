import 'package:flutter/material.dart';
import 'package:framework_challenge/features/cart/presentation/widgets/cart_list.dart';
import 'package:framework_challenge/features/cart/presentation/widgets/cart_total.dart';
import 'package:framework_challenge/shared/widgets/body.dart';
import 'package:framework_challenge/shared/widgets/button.dart';
import 'package:framework_challenge/shared/widgets/space.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _crossAlign = CrossAxisAlignment.stretch;

    return Body(
      child: Column(
        crossAxisAlignment: _crossAlign,
        children: [
          const VSpace(16),
          _count(1),
          const VSpace(16),
          const CartList(),
          const VSpace(16),
          const CartTotal(),
          const VSpace(24),
          const StretchButton(
            text: 'Checkout',
          ),
          const VSpace(24),
        ],
      ),
    );
  }

  _count(quantity) {
    const _weight = FontWeight.w700;
    const _size = 24.0;

    const _highlight = Colors.green;

    return Row(
      children: [
        const Text(
          "Total de ",
          style: TextStyle(
            fontWeight: _weight,
            fontSize: _size,
          ),
        ),
        Text(
          quantity.toString(),
          style: const TextStyle(
            fontWeight: _weight,
            fontSize: _size,
            color: _highlight,
          ),
        ),
        Text(
          quantity == 1 ? " item" : " itens",
          style: const TextStyle(
            fontWeight: _weight,
            fontSize: _size,
          ),
        ),
      ],
    );
  }
}
