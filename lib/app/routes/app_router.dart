import 'package:go_router/go_router.dart';
import 'package:zavi_bazaar/main.dart';

enum Routes { splash, home }

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: "/",
    routes: [GoRoute(path: "/", builder: (context, state) => HomeScreen())],
  );
}
