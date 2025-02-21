import 'package:go_router/go_router.dart';
import 'package:navigation_time/screens/main_navigation/main_navigation.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: "/:tab(|search|activity|profile)",
      builder: (context, state) {
        final tab = state.pathParameters["tab"] ?? "";
        return MainNavigation(tab: tab);
      },
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const MainNavigation(tab: "search"),
    ),
    GoRoute(
      path: '/write',
      builder: (context, state) => const MainNavigation(tab: "write"),
    ),
    GoRoute(
      path: '/activity',
      builder: (context, state) => const MainNavigation(tab: "activity"),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const MainNavigation(tab: "profile"),
    ),
    GoRoute(
      path: '/profile/settings',
      builder: (context, state) => const MainNavigation(tab: "settings"),
    ),
    GoRoute(
      path: '/profile/privacy',
      builder: (context, state) => const MainNavigation(tab: "privacy"),
    ),
  ],
);
