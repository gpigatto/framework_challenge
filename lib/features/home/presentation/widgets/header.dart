import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _text(),
        _avatar(),
      ],
    );
  }

  _text() {
    return const Flexible(
      child: Text(
        'Aqui você encontra as melhores frutas',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  _avatar() {
    const _padding = 14.0;
    const _radius = 14.0;

    const _borderColor = Colors.green;

    const _iconColor = Colors.green;
    const _icon = Icons.login;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(_radius)),
        border: Border.all(color: _borderColor),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(_radius)),
        onTap: () => {},
        child: const Padding(
          padding: EdgeInsets.all(_padding),
          child: Icon(
            _icon,
            color: _iconColor,
          ),
        ),
      ),
    );
  }
}
