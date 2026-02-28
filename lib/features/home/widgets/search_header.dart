import 'package:flutter/material.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';
import 'package:zavi_bazaar/core/constants/app_images.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 0, 12, 12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppConstants.primaryColor, width: 1.5),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isCollapsed: true,
                        hintText: AppConstants.searchKey,
                        hintStyle: TextStyle(
                          fontSize: Dimensions.fontSizeLarge,
                          color: Colors.black.withValues(alpha: .7),
                        ),
                      ),
                    ),
                  ),
                  Image.asset(AppImages.cameraSearch, width: 25),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 40,
                    width: 50,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstants.primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSizeExtraSmall,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          AppConstants.search,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.fontSizeExtraSmall,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.mobile_screen_share_outlined),
        ],
      ),
    );
  }
}
