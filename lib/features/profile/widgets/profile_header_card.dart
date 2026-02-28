import 'package:flutter/material.dart';
import 'package:zavi_bazaar/core/constants/app_images.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';

class ProfileHeaderCard extends StatelessWidget {
  final String name;
  final int wishlist;
  final int followedStores;
  final int vouchers;

  const ProfileHeaderCard({
    super.key,
    required this.name,
    required this.wishlist,
    required this.followedStores,
    required this.vouchers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSizeSmall,
        vertical: Dimensions.paddingSizeLarge,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey.shade300,
            child: Image.asset(AppImages.personAvatar),
          ),
          const SizedBox(width: Dimensions.paddingSizeDefault),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: Dimensions.fontSizeExtraLarge,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                Row(
                  children: [
                    Info(count: wishlist, label: 'Wishlist'),
                    SizedBox(width: 12),
                    Info(count: followedStores, label: 'Followed Stores'),
                    SizedBox(width: 12),
                    Info(count: vouchers, label: 'Vouchers'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Info extends StatelessWidget {
  final int count;
  final String label;

  const Info({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$count $label',
      style: TextStyle(fontSize: Dimensions.fontSizeOverSmall, color: Colors.grey.shade600),
    );
  }
}
