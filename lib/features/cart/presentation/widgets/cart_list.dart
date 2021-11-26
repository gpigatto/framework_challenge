import 'package:flutter/material.dart';
import 'package:framework_challenge/features/cart/presentation/widgets/cart_item.dart';

class CartList extends StatelessWidget {
  const CartList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _borderColor = Colors.black38;
    const _borderWidth = 1.2;
    const _radius = 16.0;

    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(_radius)),
            border: Border.all(
              color: _borderColor,
              width: _borderWidth,
            ),
          ),
          child: Column(
            children: [
              CartItem(),
            ],
          ),
        ),
      ),
    );
  }
}
