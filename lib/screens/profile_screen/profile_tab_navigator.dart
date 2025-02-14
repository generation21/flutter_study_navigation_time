// profile_tab_navigator.dart
import 'package:flutter/material.dart';
import 'package:navigation_time/screens/profile_screen/privacy_screen.dart';
import 'package:navigation_time/screens/profile_screen/profile_screen.dart';
import 'package:navigation_time/screens/profile_screen/settings_screen.dart';

class ProfileTabNavigator extends StatelessWidget {
  const ProfileTabNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (BuildContext _) => const ProfileScreen();
            break;
          case '/settings':
            builder = (BuildContext _) => const SettingsScreen();
            break;
          case '/privacy':
            builder = (BuildContext _) => const PrivacyScreen();
            break;
          default:
            builder = (BuildContext _) => const ProfileScreen();
            break;
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
