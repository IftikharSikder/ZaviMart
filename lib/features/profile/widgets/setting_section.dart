import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';

class SettingsSection extends StatelessWidget {
  final List<SettingsItem> items;

  const SettingsSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
      ),
      child: Column(children: items),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String label;
  final String? value;
  final bool isLast;

  const SettingsItem({super.key, required this.label, this.value, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: isLast
              ? const BorderRadius.vertical(bottom: Radius.circular(Dimensions.radiusDefault))
              : BorderRadius.zero,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault,
              vertical: Dimensions.paddingSizeDefault,
            ),
            child: Row(
              children: [
                // Label
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(fontSize: Dimensions.fontSizeDefault, color: Colors.black87),
                  ),
                ),

                // Value
                if (value != null) ...[
                  Text(
                    value!,
                    style: TextStyle(
                      fontSize: Dimensions.fontSizeDefault,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                ],

                // Chevron
                Icon(CupertinoIcons.chevron_right, size: 16, color: Colors.grey.shade400),
              ],
            ),
          ),
        ),
        if (!isLast)
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.shade100,
            indent: Dimensions.paddingSizeDefault,
          ),
      ],
    );
  }
}
