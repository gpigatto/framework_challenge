import 'package:flutter/material.dart';
import 'package:framework_challenge/shared/app_theme.dart';
import 'package:framework_challenge/shared/widgets/button.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _crossAlign = CrossAxisAlignment.start;

    return Column(
      crossAxisAlignment: _crossAlign,
      children: [
        _back(context),
      ],
    );
  }

  _back(context) {
    const _icon = Icons.arrow_back_ios_new_rounded;
    final _borderColor = AppTheme().colors.green;
    final _iconColor = AppTheme().colors.green;

    return Button(
      borderColor: _borderColor,
      icon: _icon,
      iconColor: _iconColor,
      function: () => {
        Navigator.pop(context),
      },
    );
  }
}
