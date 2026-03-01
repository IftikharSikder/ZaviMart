import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zavi_bazaar/features/auth/presentation/widgets/custom_nav_bar.dart';
import 'package:zavi_bazaar/features/cart/screens/cart_screen.dart';
import 'package:zavi_bazaar/features/chat/screens/chat_screen.dart';
import 'package:zavi_bazaar/features/dashboard/bloc/navigation_bloc.dart';
import 'package:zavi_bazaar/features/dashboard/bloc/navigation_state.dart';
import 'package:zavi_bazaar/features/home/screens/home_screen.dart';
import 'package:zavi_bazaar/features/offer/screens/offer_screen.dart';
import 'package:zavi_bazaar/features/profile/presentation/screens/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    List screens = [HomeScreen(), ChatScreen(), OfferScreen(), CartScreen(), ProfileScreen()];

    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return screens[state.index ?? 0];
        },
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
