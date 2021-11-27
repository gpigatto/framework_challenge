import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:framework_challenge/shared/app_theme.dart';
import 'package:framework_challenge/shared/widgets/space.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinField extends StatelessWidget {
  final String title;
  final Function onComplete;

  const PinField({
    Key? key,
    required this.title,
    required this.onComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _padding = 16.0;
    const _radius = 16.0;

    final _background = AppTheme().colors.white;

    return Container(
      decoration: BoxDecoration(
        color: _background,
        borderRadius: const BorderRadius.all(
          Radius.circular(_radius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(_padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _pinTitle(title),
            const VSpace(16),
            _pin(
              context,
              (value) => {onComplete(value)},
            )
          ],
        ),
      ),
    );
  }

  _pin(BuildContext context, Function onComplete) {
    const _innerRadius = 8.0;

    final _textColor = AppTheme().colors.green;
    final _background = AppTheme().colors.white;
    final _activeColor = AppTheme().colors.green;

    const _shape = PinCodeFieldShape.box;
    const _length = 4;

    const _animation = AnimationType.fade;
    const _animationDuration = Duration(milliseconds: 300);

    return PinCodeTextField(
      appContext: context,
      length: _length,
      obscureText: true,
      animationType: _animation,
      cursorColor: _textColor,
      pinTheme: PinTheme(
        shape: _shape,
        borderRadius: BorderRadius.circular(_innerRadius),
        activeFillColor: _background,
        activeColor: _activeColor,
        selectedColor: _activeColor,
        selectedFillColor: _activeColor,
        inactiveColor: _activeColor,
        inactiveFillColor: _background,
      ),
      animationDuration: _animationDuration,
      enableActiveFill: true,
      onCompleted: (v) => onComplete(v),
      onChanged: (value) => {},
      beforeTextPaste: (text) {
        return false;
      },
      keyboardType: TextInputType.number,
      autoFocus: true,
    );
  }

  _pinTitle(title) {
    final _textColor = AppTheme().colors.green;
    const _textSize = 20.0;

    final _iconColor = AppTheme().colors.darkGray;

    return Row(
      children: [
        Icon(
          Icons.lock,
          color: _iconColor,
        ),
        const HSpace(4),
        Text(
          title,
          style: TextStyle(
            color: _textColor,
            fontSize: _textSize,
          ),
        ),
      ],
    );
  }
}
