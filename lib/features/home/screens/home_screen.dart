import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zavi_bazaar/features/home/bloc/promotional_banner/promotional_banner_bloc.dart';
import 'package:zavi_bazaar/features/home/bloc/promotional_banner/promotional_banner_event.dart';
import 'package:zavi_bazaar/features/home/widgets/category_tab_widget.dart';
import 'package:zavi_bazaar/features/home/widgets/header_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<dynamic> getData() async {
    context.read<PromotionalBannerBloc>().add(GetPromotionalBanner());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        clipBehavior: Clip.none,
        headerSliverBuilder: (context, isScrolled) => [HeaderWidgets(), CategoryTabWidget()],
        body: Center(child: Text("Product here")),
      ),
    );
  }
}
