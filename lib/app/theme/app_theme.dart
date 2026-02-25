import 'package:flutter/material.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';

Color primaryColor = Color(0xFFfd4a01);

ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  fontFamily: AppConstants.fontFamily,
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  useMaterial3: true,
);
