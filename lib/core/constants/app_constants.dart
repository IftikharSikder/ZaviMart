import 'package:flutter/material.dart';
import 'package:zavi_bazaar/gen/fonts.gen.dart';

class AppConstants {
  //Theme Color
  static const Color primaryColor = Color(0xFFfd4a01);

  //General
  static const String appName = "ZaviMart";
  static const String fontFamily = FontFamily.roboto;

  //base url
  static const String baseURl = "https://fakestoreapi.com";

  //api endpoints
  static const String login = "/auth/login";

  //signIn
  static const String welcome = "Welcome back!";
  static const String signInMsg = "Sign in to Continue";
  static const String signIn = "Sign In";
  static const String email = "Email";
  static const String emailValidationMsg = "Email your email";
  static const String password = "Password";
  static const String passValidationMsg = "Email your password";
  static const String success = "Successful";

  //platform compatibility
  static const String notSupportedMsg = "Sorry! currently this platform not supported";
}
