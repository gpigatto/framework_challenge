import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:framework_challenge/features/cart/presentation/bloc/cart_cubit.dart';
import 'package:framework_challenge/shared/widgets/button.dart';
import 'package:framework_challenge/shared/widgets/header.dart';
import 'package:framework_challenge/features/item/presentation/widgets/item_image.dart';
import 'package:framework_challenge/features/item/presentation/widgets/item_information.dart';
import 'package:framework_challenge/shared/widgets/body.dart';
import 'package:framework_challenge/shared/widgets/space.dart';
import 'package:framework_challenge/shared/widgets/toast.dart';

class Item extends StatefulWidget {
  final int id;
  final String imgPath;
  final String name;
  final double value;
  final String curiosity;

  const Item({
    Key? key,
    required this.id,
    required this.imgPath,
    required this.name,
    required this.value,
    required this.curiosity,
  }) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  List<CartObject> _list = [];
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    const _crossAlign = CrossAxisAlignment.stretch;

    return BlocBuilder<CartCubit, List<CartObject>>(
      builder: (context, state) {
        _list = state;

        var _index = state.indexWhere((element) => element.id == widget.id);
        var _initialQuantity = 0;

        if (_index >= 0) {
          _initialQuantity = state[_index].quantity;
        }

        return Body(
          child: Column(
            crossAxisAlignment: _crossAlign,
            children: [
              const VSpace(16),
              const Header(),
              const VSpace(8),
              ItemImage(
                imagePath: widget.imgPath,
                heroTag: widget.id.toString(),
              ),
              const VSpace(16),
              ItemInformation(
                name: widget.name,
                value: widget.value,
                initialQuantity: _initialQuantity,
                callback: (quantity) {
                  _quantity = quantity;

                  return 0;
                },
              ),
              const VSpace(16),
              const Divider(
                height: 2,
              ),
              const VSpace(16),
              _titleCuriosity('Curiosidade'),
              const VSpace(8),
              _curiosity(widget.curiosity),
              const VSpace(16),
              StretchButton(
                text: 'Adicionar ao Carrinho',
                function: () {
                  context.read<CartCubit>().onListChange(
                        _list,
                        CartObject(
                          id: widget.id,
                          imagePath: widget.imgPath,
                          name: widget.name,
                          quantity: _quantity,
                          value: widget.value,
                          total: _quantity * widget.value,
                        ),
                      );

                  CustomToast().successToast(
                    _quantity == 0
                        ? "${widget.name} removido no carrinho!"
                        : "${_quantity}kg de ${widget.name} no carrinho!",
                    ToastGravity.BOTTOM,
                  );

                  Navigator.pop(context);
                },
              ),
              const VSpace(16),
            ],
          ),
        );
      },
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
