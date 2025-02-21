// profile_tab_navigator.dart
import 'package:flutter/material.dart';
import 'package:navigation_time/screens/profile_screen/privacy_screen.dart';
import 'package:navigation_time/screens/profile_screen/profile_screen.dart';
import 'package:navigation_time/screens/profile_screen/settings_screen.dart';

class ProfileTabNavigator extends StatelessWidget {
  final String tab;
  const ProfileTabNavigator({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    switch (tab) {
      case 'profile':
        return const ProfileScreen();
      case 'settings':
        return const SettingsScreen();
      case 'privacy':
        return const PrivacyScreen();
      default:
        return const ProfileScreen();
    }
  }
}
