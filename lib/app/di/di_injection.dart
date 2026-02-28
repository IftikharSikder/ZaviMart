import 'package:get_it/get_it.dart';
import 'package:zavi_bazaar/app/config/api_client.dart';
import 'package:zavi_bazaar/features/auth/presentation/bloc/password_visibility/password_visibility_cubit.dart';
import 'package:zavi_bazaar/features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:zavi_bazaar/features/dashboard/bloc/navigation_bloc.dart';
import 'package:zavi_bazaar/features/home/bloc/promotional_banner/promotional_banner_bloc.dart';

Future<void> init() async {
  final di = GetIt.instance;

  di.registerLazySingleton<ApiClient>(() => ApiClient());
  di.registerLazySingleton<PasswordVisibilityCubit>(() => PasswordVisibilityCubit());
  di.registerLazySingleton<SignInBloc>(() => SignInBloc(apiClient: di<ApiClient>()));
  di.registerLazySingleton<NavigationBloc>(() => NavigationBloc());
  di.registerLazySingleton<PromotionalBannerBloc>(() => PromotionalBannerBloc());
}
