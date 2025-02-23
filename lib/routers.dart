import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_time/repos/authentication_repo.dart';
import 'package:navigation_time/screens/home_screen/home_screen.dart';
import 'package:navigation_time/screens/login_screen.dart';
import 'package:navigation_time/screens/main_navigation/main_navigation.dart';
import 'package:navigation_time/screens/singup_screen.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: LoginScreen.routeURL,
      redirect: (context, state) {
        final isLoggedIn = ref.watch(authRepo).isLoggedIn;
        final isAuthPage = state.matchedLocation == LoginScreen.routeURL ||
            state.matchedLocation == SignUpScreen.routeURL;

        if (!isLoggedIn && !isAuthPage) {
          return LoginScreen.routeURL;
        }

        return null;
      },
      routes: [
        GoRoute(
          path: SignUpScreen.routeURL,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: LoginScreen.routeURL,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          name: HomeScreen.routeName,
          path: HomeScreen.routeURL,
          builder: (context, state) => const MainNavigation(tab: "home"),
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
          path: '/settings',
          builder: (context, state) => const MainNavigation(tab: "settings"),
          routes: [
            GoRoute(
              path: '/privacy',
              builder: (context, state) => const MainNavigation(tab: "privacy"),
            ),
          ],
        ),
      ],
    );
  },
);
