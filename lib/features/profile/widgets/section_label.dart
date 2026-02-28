import 'package:flutter/material.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';

class SectionLabel extends StatelessWidget {
  final String label;

  const SectionLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.paddingSizeDefault,
        bottom: Dimensions.paddingSizeExtraSmall,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: Dimensions.fontSizeDefault,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade500,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}
