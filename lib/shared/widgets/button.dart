import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final MaterialColor borderColor;
  final IconData icon;
  final MaterialColor iconColor;
  final Function function;

  const Button({
    Key? key,
    required this.borderColor,
    required this.icon,
    required this.iconColor,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _padding = 12.0;
    const _radius = 14.0;
    const _width = 2.4;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(_radius)),
        border: Border.all(
          color: borderColor,
          width: _width,
        ),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(_radius)),
        onTap: () => {function()},
        child: Padding(
          padding: const EdgeInsets.all(_padding),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
