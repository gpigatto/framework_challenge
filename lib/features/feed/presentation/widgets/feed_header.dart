import 'package:flutter/material.dart';
import 'package:framework_challenge/shared/widgets/button.dart';

class FeedHeader extends StatelessWidget {
  const FeedHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _text('Aqui você encontra as melhores frutas'),
        _avatar(true),
      ],
    );
  }

  _text(text) {
    const _size = 24.0;
    const _weight = FontWeight.w800;

    return Flexible(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: _size,
          fontWeight: _weight,
        ),
      ),
    );
  }

  _avatar(logged) {
    IconData _icon;

    if (logged) {
      _icon = Icons.person;
    } else {
      _icon = Icons.login;
    }

    const _borderColor = Colors.green;
    const _iconColor = Colors.green;

    return Button(
      borderColor: _borderColor,
      icon: _icon,
      iconColor: _iconColor,
      function: () {},
    );
  }
}
