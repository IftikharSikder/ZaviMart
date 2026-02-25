import 'package:go_router/go_router.dart';
import 'package:zavi_bazaar/features/splash/presentation/screens/splash_screen.dart';

enum Routes { splash, home }

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: "/",
    routes: [GoRoute(path: "/", builder: (context, state) => SplashScreen())],
  );
}
