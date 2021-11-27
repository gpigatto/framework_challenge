import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:framework_challenge/features/cart/presentation/bloc/cart_cubit.dart';
import 'package:framework_challenge/features/cart/presentation/widgets/cart_item.dart';

class CartList extends StatefulWidget {
  const CartList({
    Key? key,
  }) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  List<CartObject> _list = [];

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
          child: BlocConsumer<CartCubit, List<CartObject>>(
            listener: (context, state) {
              setState(() {
                _list = state;
              });
            },
            builder: (context, state) {
              _list = state;

              return Column(
                children: _list.map((item) {
                  return CartItem(
                    cartList: _list,
                    cartObject: item,
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
