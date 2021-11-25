import 'package:flutter/material.dart';
import 'package:framework_challenge/shared/widgets/space.dart';

class FruitCard extends StatelessWidget {
  final String name;
  final double value;
  final String imgPath;
  final Function function;

  const FruitCard({
    Key? key,
    required this.name,
    required this.value,
    required this.imgPath,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _padding = 14.0;
    const _radius = 28.0;

    const _borderColor = Colors.black12;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(_radius)),
        border: Border.all(color: _borderColor),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(_radius)),
        onTap: () => {function()},
        child: Padding(
          padding: const EdgeInsets.all(_padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Image(imgPath: imgPath),
              _Information(name: name, value: value),
            ],
          ),
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.imgPath,
  }) : super(key: key);

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image(
          image: AssetImage(imgPath),
        ),
      ),
    );
  }
}

class _Information extends StatelessWidget {
  const _Information({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  final String name;
  final double value;

  @override
  Widget build(BuildContext context) {
    const _rowMainAxis = MainAxisAlignment.spaceBetween;
    const _rowCrossAxis = CrossAxisAlignment.end;

    const _columnCrossAxis = CrossAxisAlignment.start;

    return Row(
      mainAxisAlignment: _rowMainAxis,
      crossAxisAlignment: _rowCrossAxis,
      children: [
        Column(
          crossAxisAlignment: _columnCrossAxis,
          children: [
            _name(name),
            const VSpace(4),
            Row(
              children: [
                _value(
                  "R\$${value.toStringAsFixed(2).replaceAll('.', ',')}",
                ),
                const HSpace(4),
                _leadingTextValue('/kg'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  _name(text) {
    const _weight = FontWeight.w600;
    const _size = 16.0;

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
    const _size = 24.0;

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
    const _size = 14.0;
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
