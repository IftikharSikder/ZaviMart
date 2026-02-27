import 'package:flutter/material.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';

Color primaryColor = AppConstants.primaryColor;

ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  fontFamily: AppConstants.fontFamily,
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  hintColor: Colors.grey,
  useMaterial3: true,
);
