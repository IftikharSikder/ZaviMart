import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zavi_bazaar/core/constants/app_images.dart';
import 'package:zavi_bazaar/features/home/bloc/promotional_banner/promotional_banner_bloc.dart';
import 'package:zavi_bazaar/features/home/bloc/promotional_banner/promotional_banner_state.dart';
import 'package:zavi_bazaar/features/home/widgets/search_header.dart';

class HeaderWidgets extends StatelessWidget {
  const HeaderWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets mediaQuery = MediaQuery.paddingOf(context);
    double width = MediaQuery.of(context).size.width;
    double expandedHeight = mediaQuery.top + 56 + (width - 32) / (16 / 6) - kToolbarHeight + 15;
    return SliverAppBar(
      pinned: true,
      toolbarHeight: 0,
      floating: false,
      snap: false,
      expandedHeight: expandedHeight,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.paddingOf(context).top),
            SearchHeader(),

            BlocBuilder<PromotionalBannerBloc, PromotionalBannerState>(
              builder: (context, state) {
                final isLoading = state is LoadingState;

                return Skeletonizer(
                  enabled: isLoading,
                  child: AspectRatio(
                    aspectRatio: 16 / 6,
                    child: Image.asset(
                      isLoading ? AppImages.bannerPlaceholder : state.imgPath.toString(),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
