import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';
import 'package:zavi_bazaar/features/profile/presentation/data/bloc/profile_bloc.dart';
import 'package:zavi_bazaar/features/profile/presentation/data/bloc/profile_event.dart';
import 'package:zavi_bazaar/features/profile/presentation/data/bloc/profile_state.dart';
import 'package:zavi_bazaar/features/profile/presentation/widgets/profile_header_card.dart';
import 'package:zavi_bazaar/features/profile/presentation/widgets/section_label.dart';
import 'package:zavi_bazaar/features/profile/presentation/widgets/setting_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    getProfileData();
    super.initState();
  }

  Future getProfileData() async {
    context.read<ProfileBloc>().add(FetchProfileInfo());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.profileInfo != null) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileHeaderCard(
                      name: state.profileInfo!.profile.name,
                      wishlist: 0,
                      followedStores: 0,
                      vouchers: 2,
                    ),
                    const SizedBox(height: Dimensions.paddingSizeDefault),

                    SectionLabel(label: state.profileInfo!.sections[0].title.toString()),
                    SettingsSection(items: state.profileInfo!.sections[0].items),

                    const SizedBox(height: Dimensions.paddingSizeDefault),

                    SectionLabel(label: state.profileInfo!.sections[1].title.toString()),
                    SettingsSection(items: state.profileInfo!.sections[1].items),

                    const SizedBox(height: Dimensions.paddingSizeDefault),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
