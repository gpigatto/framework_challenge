import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String label;
  final Function function;

  const LoginButton({Key? key, required this.label, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = Colors.black38;
    final _textColor = Colors.white;

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
          onTap: () => function(),
          borderRadius: const BorderRadius.all(
            Radius.circular(_radius),
          ),
          child: Padding(
            padding: const EdgeInsets.all(_padding),
            child: Text(
              label,
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
