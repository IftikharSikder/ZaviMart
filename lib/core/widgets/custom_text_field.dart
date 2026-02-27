import 'package:flutter/material.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool? isPassword;
  final bool? isPasswordShouldVisible;
  final Icon? prefix;
  final Icon? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final String? hintText;
  final String? validationText;
  const CustomTextField({
    super.key,
    required this.controller,
    this.prefix,
    this.isPassword,
    this.hintText,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.isPasswordShouldVisible,
    this.validationText,
  });

  @override
  Widget build(BuildContext context) {
    final isPasswordField = isPassword != null && isPassword == true;
    final isPasswordVisible = isPasswordShouldVisible != null && isPasswordShouldVisible == true;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35).copyWith(bottom: Dimensions.paddingSizeDefault),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validationText;
          }
          return null;
        },
        obscureText: isPasswordField && !isPasswordVisible,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: onSuffixIconTap != null
              ? GestureDetector(onTap: onSuffixIconTap, child: suffixIcon)
              : suffixIcon,
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
