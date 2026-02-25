import 'package:flutter/material.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';

class AppTextStyles {
  static final TextStyle robotoRegular = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.fontSizeDefault,
  );

  static final TextStyle robotoMedium = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: Dimensions.fontSizeDefault,
  );

  static final TextStyle robotoBold = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: Dimensions.fontSizeDefault,
  );

  static final TextStyle robotoBlack = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.w900,
    fontSize: Dimensions.fontSizeDefault,
  );
}
