import 'package:flutter/material.dart';

class AppTheme {
  final AppColors appColors = new AppColors();

  AppColors get colors => appColors;
}

class AppColors {
  Color get green => const Color(0xFFA7D81A);
  Color get darkGray => const Color(0xFF474B3D);
  Color get lightGray => const Color(0xFFB3B5B0);
  Color get white => const Color(0xFFFFFFFF);
}
