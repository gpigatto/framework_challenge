import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:framework_challenge/shared/app_theme.dart';

class CustomToast {
  errorToast(message, position) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: position,
      timeInSecForIosWeb: 1,
      backgroundColor: AppTheme().colors.darkGray,
      textColor: AppTheme().colors.white,
      fontSize: 16.0,
    );
  }

  successToast(message, position) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: position,
      timeInSecForIosWeb: 1,
      backgroundColor: AppTheme().colors.green,
      textColor: AppTheme().colors.white,
      fontSize: 16.0,
    );
  }
}
