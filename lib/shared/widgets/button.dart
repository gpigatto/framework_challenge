import 'package:flutter/material.dart';
import 'package:framework_challenge/shared/app_theme.dart';

class Button extends StatelessWidget {
  final Color borderColor;
  final IconData icon;
  final Color iconColor;
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

class StretchButton extends StatelessWidget {
  final String text;
  final Function function;

  const StretchButton({
    Key? key,
    required this.text,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _padding = 14.0;
    const _radius = 14.0;

    final _color = AppTheme().colors.green;

    const _size = 22.0;
    const _weight = FontWeight.w600;
    final _textColor = AppTheme().colors.white;

    return Container(
      width: double.maxFinite,
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
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: _size,
                fontWeight: _weight,
                color: _textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
