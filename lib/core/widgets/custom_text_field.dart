import 'package:flutter/material.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Icon? prefix;
  final bool? isSuffix;
  final String? hintText;
  const CustomTextField({
    super.key,
    required this.controller,
    this.prefix,
    this.isSuffix,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35).copyWith(bottom: Dimensions.paddingSizeDefault),
      child: TextFormField(
        controller: controller,
        obscureText: isSuffix != null && isSuffix == true ? true : false,
        decoration: InputDecoration(
          prefixIcon: prefix,
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).hintColor),
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          prefixIconColor: Theme.of(context).hintColor,
          border: outlineInputBorder(context),
          enabledBorder: outlineInputBorder(context),
          focusedBorder: outlineInputBorder(context),
          errorBorder: outlineInputBorder(context),
          focusedErrorBorder: outlineInputBorder(context),
        ),
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
    borderSide: BorderSide(color: Theme.of(context).hintColor.withValues(alpha: .3), width: 1.5),
  );
}
