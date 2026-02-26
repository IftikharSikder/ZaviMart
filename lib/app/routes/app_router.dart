import 'package:go_router/go_router.dart';
import 'package:zavi_bazaar/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:zavi_bazaar/features/splash/presentation/screens/splash_screen.dart';

enum Routes { splash, signIn, home }

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(path: "/", builder: (context, state) => SplashScreen()),
      GoRoute(
        name: Routes.signIn.name,
        path: "/signIn",
        builder: (context, state) => SignInScreen(),
      ),
    ],
  );
}
