import 'package:flutter/material.dart';
import 'package:framework_challenge/shared/widgets/space.dart';

class ItemInformation extends StatelessWidget {
  final String name;
  final double value;
  final int quantity;

  const ItemInformation({
    Key? key,
    required this.name,
    required this.value,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _columnCrossAlign = CrossAxisAlignment.start;
    const _rowMainAlign = MainAxisAlignment.spaceBetween;

    return Column(
      crossAxisAlignment: _columnCrossAlign,
      children: [
        _title(name),
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
          "R\$${value.toStringAsFixed(2).replaceAll('.', ',')}",
        ),
        const HSpace(4),
        _leadingTextValue('/kg'),
      ],
    );
  }

  _value(text) {
    const _weight = FontWeight.w700;
    const _size = 32.0;

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

  _leadingTextValue(text) {
    const _size = 16.0;
    const _color = Colors.black26;

    return Text(
      text,
      style: const TextStyle(
        fontSize: _size,
        color: _color,
      ),
    );
  }

  _productQuantity() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _button(Icons.remove),
        const HSpace(16),
        Column(
          children: [
            _quantity(quantity),
            _leadingTextValue('kg'),
          ],
        ),
        const HSpace(16),
        _button(Icons.add),
      ],
    );
  }

  _button(icon) {
    const _padding = 8.0;
    const _radius = 14.0;

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
          ),
        ),
      ),
    );
  }

  _quantity(value) {
    const _weight = FontWeight.w800;
    const _size = 32.0;

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
}
