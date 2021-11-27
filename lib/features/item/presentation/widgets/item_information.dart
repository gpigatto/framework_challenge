import 'package:flutter/material.dart';
import 'package:framework_challenge/shared/app_theme.dart';
import 'package:framework_challenge/shared/widgets/space.dart';

typedef IntValue = int Function(int);

class ItemInformation extends StatefulWidget {
  final String name;
  final double value;
  final IntValue callback;
  final int initialQuantity;

  const ItemInformation({
    Key? key,
    required this.name,
    required this.value,
    required this.callback,
    required this.initialQuantity,
  }) : super(key: key);

  @override
  State<ItemInformation> createState() => _ItemInformationState();
}

class _ItemInformationState extends State<ItemInformation> {
  int quantity = 0;

  @override
  void initState() {
    setState(() {
      quantity = widget.initialQuantity;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const _columnCrossAlign = CrossAxisAlignment.start;
    const _rowMainAlign = MainAxisAlignment.spaceBetween;

    return Column(
      crossAxisAlignment: _columnCrossAlign,
      children: [
        _title(widget.name),
        const VSpace(8),
        Row(
          mainAxisAlignment: _rowMainAlign,
          children: [
            _productValue(),
            _productQuantity(),
          ],
        ),
      ],
    );
  }

  _title(text) {
    const _size = 24.0;
    const _weight = FontWeight.w800;

    return Text(
      text,
      style: const TextStyle(
        fontSize: _size,
        fontWeight: _weight,
      ),
    );
  }

  _productValue() {
    return Row(
      children: [
        _value(
          "R\$${widget.value.toStringAsFixed(2).replaceAll('.', ',')}",
        ),
        const HSpace(4),
        _leadingTextValue('/kg'),
      ],
    );
  }

  _value(text) {
    const _weight = FontWeight.w700;
    const _size = 32.0;

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

  _leadingTextValue(text) {
    const _size = 16.0;
    final _color = AppTheme().colors.lightGray;

    return Text(
      text,
      style: TextStyle(
        fontSize: _size,
        color: _color,
      ),
    );
  }

  _productQuantity() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _button(
          Icons.remove,
          () {
            if (quantity > 0) {
              setState(() {
                quantity--;
              });

              widget.callback(quantity);
            }
          },
          true,
        ),
        const HSpace(16),
        Column(
          children: [
            _quantity(),
            _leadingTextValue('kg'),
          ],
        ),
        const HSpace(16),
        _button(
          Icons.add,
          () {
            if (quantity < 99) {
              setState(() {
                quantity++;
              });

              widget.callback(quantity);
            }
          },
          false,
        ),
      ],
    );
  }

  _button(icon, function, remove) {
    const _padding = 8.0;
    const _radius = 14.0;

    Color _color;

    if (quantity != 0 && remove || quantity < 99 && !remove) {
      _color = AppTheme().colors.green;
    } else {
      _color = AppTheme().colors.darkGray;
    }

    final _iconColor = AppTheme().colors.white;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(_radius)),
        color: _color,
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(_radius)),
        onTap: () {
          function();
        },
        child: Padding(
          padding: const EdgeInsets.all(_padding),
          child: Icon(
            icon,
            color: _iconColor,
          ),
        ),
      ),
    );
  }

  _quantity() {
    const _weight = FontWeight.w800;
    const _size = 32.0;

    const _color = Colors.black;

    return Text(
      quantity.toString(),
      style: const TextStyle(
        fontWeight: _weight,
        fontSize: _size,
        color: _color,
      ),
    );
  }
}
