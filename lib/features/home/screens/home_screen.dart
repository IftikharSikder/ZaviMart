import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';
import 'package:zavi_bazaar/features/home/bloc/product/product_bloc.dart';
import 'package:zavi_bazaar/features/home/bloc/product/product_event.dart';
import 'package:zavi_bazaar/features/home/bloc/promotional_banner/promotional_banner_bloc.dart';
import 'package:zavi_bazaar/features/home/bloc/promotional_banner/promotional_banner_event.dart';
import 'package:zavi_bazaar/features/home/widgets/category_content_widget.dart';
import 'package:zavi_bazaar/features/home/widgets/category_tab_widget.dart';
import 'package:zavi_bazaar/features/home/widgets/header_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final TextEditingController searchController = TextEditingController();
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: AppConstants.categories.length, vsync: this);
    getData();
    super.initState();
  }

  Future<dynamic> getData() async {
    context.read<PromotionalBannerBloc>().add(GetPromotionalBanner());
    context.read<ProductBloc>().add(FetchProduct());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        clipBehavior: Clip.none,
        headerSliverBuilder: (context, isScrolled) => [
          HeaderWidgets(),
          CategoryTabWidget(tabController: _tabController),
        ],

        body: TabBarView(
          controller: _tabController,
          physics: const PageScrollPhysics(),
          children: List.generate(
            AppConstants.categories.length,
            (index) =>
                CategoryContentWidget(label: AppConstants.categories[index], categoryIndex: index),
          ),
        ),
      ),
    );
  }
}
