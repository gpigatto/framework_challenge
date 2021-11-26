import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  final Function onChage;
  final Function onSubmit;

  const UsernameField({
    Key? key,
    required this.onChage,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = Colors.white;
    final _cursorColor = Colors.green;

    final _icon = Icons.person;
    final _iconColor = Colors.black38;

    const _radius = 16.0;
    const _innerPaddingHorizontal = 8.0;
    const _innerPaddingVertical = 4.0;
    const _fontSize = 22.0;

    const _hint = "Username";

    return Container(
      decoration: BoxDecoration(
        color: _color,
        borderRadius: const BorderRadius.all(
          Radius.circular(_radius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: _innerPaddingVertical,
          horizontal: _innerPaddingHorizontal,
        ),
        child: TextField(
          cursorColor: _cursorColor,
          decoration: InputDecoration(
            hintText: _hint,
            hintStyle: const TextStyle(
              fontSize: _fontSize,
            ),
            border: InputBorder.none,
            icon: Icon(
              _icon,
              color: _iconColor,
            ),
          ),
          style: const TextStyle(
            fontSize: _fontSize,
          ),
          onChanged: (value) => onChage(value),
          onSubmitted: (value) => onSubmit(value),
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }
}
