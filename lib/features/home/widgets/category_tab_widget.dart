import 'package:flutter/material.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';

class CategoryTabWidget extends StatelessWidget {
  final TabController tabController;
  const CategoryTabWidget({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _TabBarHeaderDelegate(
        TabBar(
          controller: tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor.withValues(alpha: .8),
              width: 3,
            ),
            insets: EdgeInsets.symmetric(horizontal: 8),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.grey.shade200,
          labelColor: Theme.of(context).primaryColor.withValues(alpha: .8),
          unselectedLabelColor: Colors.grey.shade500,
          labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: Dimensions.fontSizeDefault),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: Dimensions.fontSizeDefault,
          ),
          splashFactory: NoSplash.splashFactory,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          tabs: List.generate(
            AppConstants.categories.length,
            (tab) => Tab(text: AppConstants.categories[tab]),
          ),
        ),
      ),
    );
  }
}

class _TabBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  const _TabBarHeaderDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(color: Theme.of(context).scaffoldBackgroundColor, child: tabBar);
  }

  @override
  bool shouldRebuild(covariant _TabBarHeaderDelegate oldDelegate) => false;
}
