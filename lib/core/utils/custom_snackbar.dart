import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';

void customSnackbar({BuildContext? context, required String msg, bool isError = false}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: !isError ? AppConstants.primaryColor : Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
