import 'package:flutter/material.dart';
import 'package:framework_challenge/features/cart/presentation/bloc/cart_cubit.dart';
import 'package:framework_challenge/shared/app_theme.dart';
import 'package:framework_challenge/shared/widgets/space.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoveDialog extends StatelessWidget {
  final List<CartObject> cartList;
  final CartObject cartObject;

  const RemoveDialog({
    Key? key,
    required this.cartList,
    required this.cartObject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _radius = 16.0;
    const _padding = 120.0;

    const _minSize = MainAxisSize.min;

    return AlertDialog(
      title: _title(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(_radius),
        ),
      ),
      content: Builder(
        builder: (context) {
          var width = MediaQuery.of(context).size.width - _padding;

          return SizedBox(
            width: width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: _minSize,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _text(),
                  const VSpace(24),
                  _signOut(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _title() {
    const _title = "Remover item";
    final _textColor = AppTheme().colors.green;
    const _textSize = 22.0;

    return Text(
      _title,
      style: TextStyle(
        color: _textColor,
        fontSize: _textSize,
      ),
    );
  }

  _text() {
    final _title = "Você quer retirar ${cartObject.name} do carrinho?";
    final _textColor = AppTheme().colors.green;
    const _textSize = 20.0;

    return Text(
      _title,
      style: TextStyle(
        color: _textColor,
        fontSize: _textSize,
      ),
    );
  }

  _signOut(BuildContext context) {
    const _text = "Remover";

    final _color = AppTheme().colors.darkGray;
    final _textColor = AppTheme().colors.white;

    const _textSize = 20.0;
    const _radius = 12.0;
    const _padding = 16.0;

    return Container(
      decoration: BoxDecoration(
        color: _color,
        borderRadius: const BorderRadius.all(
          Radius.circular(_radius),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            context.read<CartCubit>().onListChange(
                  cartList,
                  CartObject(
                    id: cartObject.id,
                    imagePath: cartObject.imagePath,
                    name: cartObject.name,
                    quantity: 0,
                    value: cartObject.value,
                    total: cartObject.quantity * cartObject.value,
                  ),
                );

            Navigator.pop(context);
          },
          borderRadius: const BorderRadius.all(
            Radius.circular(_radius),
          ),
          child: Padding(
            padding: const EdgeInsets.all(_padding),
            child: Text(
              _text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _textColor,
                fontSize: _textSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
