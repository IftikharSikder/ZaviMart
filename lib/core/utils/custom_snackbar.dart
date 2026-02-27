import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';

customSnackbar({BuildContext? context, required String msg, Color? color}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color ?? AppConstants.primaryColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
