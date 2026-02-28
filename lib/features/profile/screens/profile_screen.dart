import 'package:flutter/material.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';
import 'package:zavi_bazaar/features/profile/widgets/profile_header_card.dart';
import 'package:zavi_bazaar/features/profile/widgets/section_label.dart';
import 'package:zavi_bazaar/features/profile/widgets/setting_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileHeaderCard(
              name: 'Iftikhar Ahammad',
              wishlist: 0,
              followedStores: 0,
              vouchers: 2,
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            const SectionLabel(label: 'Account Information'),
            SettingsSection(
              items: [
                SettingsItem(label: 'Full Name', value: 'Iftikhar Ahammad'),
                SettingsItem(label: 'Set Password'),
                SettingsItem(label: 'Add Mobile', value: 'Not Set'),
                SettingsItem(label: 'Change Email', value: 'if*****@gmail.com'),
                SettingsItem(label: 'Gender', value: 'Not Set'),
                SettingsItem(label: 'Birthday', value: 'Not Set', isLast: true),
              ],
            ),

            const SizedBox(height: Dimensions.paddingSizeDefault),

            const SectionLabel(label: 'More'),
            SettingsSection(
              items: [
                SettingsItem(label: 'Notification Settings'),
                SettingsItem(label: 'Privacy Policy'),
                SettingsItem(label: 'Terms & Conditions'),
              ],
            ),

            const SizedBox(height: Dimensions.paddingSizeDefault),
          ],
        ),
      ),
    );
  }
}
