import 'package:flutter/material.dart';
import 'package:framework_challenge/features/cart/presentation/bloc/cart_cubit.dart';
import 'package:framework_challenge/features/cart/presentation/pages/remove_dialog.dart';
import 'package:framework_challenge/shared/app_theme.dart';
import 'package:framework_challenge/shared/widgets/space.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatefulWidget {
  final List<CartObject> cartList;
  final CartObject cartObject;

  const CartItem({
    Key? key,
    required this.cartObject,
    required this.cartList,
  }) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int _itemQuantity = 0;

  @override
  void initState() {
    _itemQuantity = widget.cartObject.quantity;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _image(widget.cartObject.imagePath),
              const HSpace(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _name(widget.cartObject.name),
                  _value(
                    "R\$${widget.cartObject.total.toStringAsFixed(2).replaceAll('.', ',')}",
                  ),
                ],
              ),
            ],
          ),
          _productQuantity(context, widget.cartObject.quantity),
        ],
      ),
    );
  }

  _image(imagePath) {
    const _maxWidth = 64.0;

    return Container(
      constraints: const BoxConstraints(maxWidth: _maxWidth),
      child: Center(
        child: Image(
          image: AssetImage(imagePath),
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

    final _color = AppTheme().colors.green;

    return Text(
      text,
      style: TextStyle(
        fontWeight: _weight,
        fontSize: _size,
        color: _color,
      ),
    );
  }

  _productQuantity(BuildContext context, quantity) {
    return Row(
      children: [
        _button(context, Icons.remove, true),
        const HSpace(16),
        Column(
          children: [
            _quantity(quantity),
            _leadingTextValue('kg'),
          ],
        ),
        const HSpace(16),
        _button(context, Icons.add, false),
      ],
    );
  }

  _button(BuildContext context, icon, remove) {
    const _padding = 4.0;
    const _radius = 10.0;

    final _color = AppTheme().colors.green;
    final _iconColor = AppTheme().colors.white;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(_radius)),
        color: _color,
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(_radius)),
        onTap: () {
          if (remove && _itemQuantity == 1) {
            showDialog(
              context: context,
              builder: (_) => RemoveDialog(
                cartList: widget.cartList,
                cartObject: widget.cartObject,
              ),
            );
          } else if (remove) {
            _itemQuantity--;

            context.read<CartCubit>().onListChange(
                  widget.cartList,
                  CartObject(
                    id: widget.cartObject.id,
                    imagePath: widget.cartObject.imagePath,
                    name: widget.cartObject.name,
                    quantity: _itemQuantity,
                    value: widget.cartObject.value,
                    total: widget.cartObject.quantity * widget.cartObject.value,
                  ),
                );
          } else {
            _itemQuantity++;

            context.read<CartCubit>().onListChange(
                  widget.cartList,
                  CartObject(
                    id: widget.cartObject.id,
                    imagePath: widget.cartObject.imagePath,
                    name: widget.cartObject.name,
                    quantity: _itemQuantity,
                    value: widget.cartObject.value,
                    total: widget.cartObject.quantity * widget.cartObject.value,
                  ),
                );
          }
        },
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
    final _color = AppTheme().colors.lightGray;

    return Text(
      text,
      style: TextStyle(
        fontSize: _size,
        color: _color,
      ),
    );
  }
}
