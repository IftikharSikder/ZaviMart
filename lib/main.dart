import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zavi_bazaar/app/routes/app_router.dart';
import 'package:zavi_bazaar/features/auth/presentation/bloc/password_visibility/password_visibility_cubit.dart';

import 'app/theme/app_theme.dart';
import 'gen/assets.gen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PasswordVisibilityCubit>(create: (context) => PasswordVisibilityCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Assets.images.logo.image()));
  }
}
