import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:zavi_bazaar/app/di/di_injection.dart';
import 'package:zavi_bazaar/app/routes/app_router.dart';
import 'package:zavi_bazaar/features/auth/presentation/bloc/password_visibility/password_visibility_cubit.dart';
import 'package:zavi_bazaar/features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:zavi_bazaar/features/dashboard/bloc/navigation_bloc.dart';
import 'package:zavi_bazaar/features/home/bloc/promotional_banner/promotional_banner_bloc.dart';

import 'app/theme/app_theme.dart';
import 'features/home/bloc/product/product_bloc.dart';
import 'features/profile/presentation/data/bloc/profile_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final di = GetIt.instance;
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: di<PasswordVisibilityCubit>()),
        BlocProvider.value(value: di<SignInBloc>()),
        BlocProvider.value(value: di<NavigationBloc>()),
        BlocProvider.value(value: di<PromotionalBannerBloc>()),
        BlocProvider.value(value: di<ProductBloc>()),
        BlocProvider.value(value: di<ProfileBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
