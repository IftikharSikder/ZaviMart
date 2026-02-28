import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color? color;
  final int maxLine;
  final TextOverflow textOverflow;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;
  const CustomText({
    super.key,
    required this.title,
    this.fontSize = 40,
    this.color,
    this.fontWeight,
    this.maxLine = 1,
    this.textOverflow = TextOverflow.ellipsis,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: textOverflow,
      maxLines: maxLine,
      style: textStyle ?? TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }
}
