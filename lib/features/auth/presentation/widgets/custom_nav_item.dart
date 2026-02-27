import 'package:flutter/material.dart';
import 'package:zavi_bazaar/app/theme/app_text_styles.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';

class CustomNavItem extends StatelessWidget {
  final String label;
  final String imgPath;
  final bool selected;
  final VoidCallback onTap;
  final int? counterIndicatorValue;

  const CustomNavItem({
    super.key,
    required this.label,
    required this.imgPath,
    required this.selected,
    required this.onTap,
    this.counterIndicatorValue,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          SizedBox(
            width: width * .15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imgPath, width: 24, height: 24),
                const SizedBox(height: 4),

                Text(
                  label,
                  style: TextStyle(
                    fontSize: Dimensions.fontSizeOverSmall,
                    color: selected ? Theme.of(context).primaryColor : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          counterIndicatorValue != null && counterIndicatorValue! > 0
              ? Positioned(
                  top: 12,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 8,
                    child: Center(
                      child: Text(
                        counterIndicatorValue.toString(),
                        style: AppTextStyles.robotoRegular.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.fontSizeExtraSmall,
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
