import 'package:flutter/material.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';

class CustomButton extends StatelessWidget {
  final bool? iconButton;
  final VoidCallback onTap;
  final IconData? icon;
  final String? buttonText;
  final Color? buttonTextColor;
  final Color? buttonColor;
  final bool? isGradient;
  final List<Color>? gradientButtonColor;
  final bool? isTextCenter;
  final double? borderRadius;
  final double? buttonHeight;
  final bool? isButtonTextBold;
  const CustomButton({
    super.key,
    this.iconButton,
    required this.onTap,
    this.icon,
    this.buttonText,
    this.buttonColor,
    this.isTextCenter,
    this.gradientButtonColor,
    this.isGradient,
    this.borderRadius = 8,
    this.buttonHeight = 40,
    this.buttonTextColor = Colors.white,
    this.isButtonTextBold = true,
  });

  @override
  Widget build(BuildContext context) {
    return iconButton != null && iconButton == true
        ? IconButton(onPressed: onTap, icon: Icon(icon))
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: InkWell(
              onTap: onTap,
              child: Container(
                height: buttonHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius ?? Dimensions.radiusDefault),
                  gradient: (isGradient != null && isGradient == true)
                      ? LinearGradient(colors: gradientButtonColor ?? [])
                      : LinearGradient(colors: []),
                ),
                child: isTextCenter != null && isTextCenter == true
                    ? Center(
                        child: Text(buttonText ?? "", style: TextStyle(color: buttonTextColor)),
                      )
                    : Text(
                        buttonText.toString(),
                        style: TextStyle(
                          color: buttonTextColor,
                          fontWeight: isButtonTextBold != null && isButtonTextBold!
                              ? FontWeight.bold
                              : null,
                        ),
                      ),
              ),
            ),
          );
  }
}
