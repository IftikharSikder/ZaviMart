import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';
import 'package:zavi_bazaar/features/profile/presentation/data/model/profile_model.dart';

class SettingsSection extends StatelessWidget {
  final List<SettingsItemModel> items;

  const SettingsSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return SettingsItem(label: item.label, value: item.value);
        },
      ),
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
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(fontSize: Dimensions.fontSizeDefault, color: Colors.black87),
                  ),
                ),

                value != null
                    ? Column(
                        children: [
                          Text(
                            value!,
                            style: TextStyle(
                              fontSize: Dimensions.fontSizeDefault,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                        ],
                      )
                    : SizedBox(),

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
