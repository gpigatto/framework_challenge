import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:framework_challenge/shared/widgets/space.dart';

class Category extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool active;

  const Category({
    Key? key,
    required this.text,
    required this.icon,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor;
    Color _textColor;
    Color _borderColor;

    if (active) {
      _backgroundColor = Colors.green;
      _textColor = Colors.white;
      _borderColor = Colors.transparent;
    } else {
      _backgroundColor = Colors.white;
      _textColor = Colors.black26;
      _borderColor = Colors.black26;
    }

    const _radius = 16.0;
    const _paddingH = 24.0;
    const _paddingV = 6.0;

    return Padding(
      padding: const EdgeInsets.only(right: _paddingV),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(_radius)),
          border: Border.all(color: _borderColor),
          color: _backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: _paddingV,
            horizontal: _paddingH,
          ),
          child: Row(
            children: [
              _icon(_textColor),
              const HSpace(4),
              _title(_textColor),
            ],
          ),
        ),
      ),
    );
  }

  _icon(Color _textColor) {
    return Icon(
      icon,
      color: _textColor,
    );
  }

  _title(Color _textColor) {
    const _weight = FontWeight.w800;

    return Text(
      text,
      style: TextStyle(
        fontWeight: _weight,
        color: _textColor,
      ),
    );
  }
}
