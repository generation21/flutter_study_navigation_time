import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_time/constant/sizes.dart';
import 'package:navigation_time/repos/authentication_repo.dart';
import 'package:navigation_time/screens/login_screen.dart';
import 'package:navigation_time/screens/profile_screen/privacy_screen.dart';
import 'package:navigation_time/view_models/dark_model_config_vm.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  static const String routeName = 'settings';
  static const String routeURL = '/settings';

  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leadingWidth: Sizes.size96,
        leading: Row(
          children: [
            IconButton(
              onPressed: () => context.go('/profile'),
              icon: const FaIcon(FontAwesomeIcons.angleLeft),
            ),
            const Text("Back"),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(Sizes.size1),
          child: Divider(
            height: Sizes.size1,
            thickness: Sizes.size1,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Dark mode"),
            leading: ref.watch(darkModeConfigProvider).isDarkMode
                ? const FaIcon(FontAwesomeIcons.sun)
                : const FaIcon(FontAwesomeIcons.moon),
            trailing: Switch.adaptive(
              value: ref.watch(darkModeConfigProvider).isDarkMode,
              onChanged: (value) {
                ref.read(darkModeConfigProvider.notifier).setDarkMode(value);
              },
              activeColor: Colors.lightGreenAccent,
            ),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.userPlus),
            title: Text("Follow and invite friends"),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.bell),
            title: Text("Notifications"),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.lock),
            title: const Text("Privacy"),
            onTap: () => context.go('/profile/privacy'),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.circleUser),
            title: Text("Account"),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.question),
            title: Text("Help"),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.info),
            title: Text("About"),
          ),
          Divider(
            height: Sizes.size1,
            thickness: Sizes.size1,
            color: Colors.grey.shade300,
          ),
          ListTile(
            title: const Text("Log out"),
            textColor: Colors.blueAccent,
            trailing: const FaIcon(FontAwesomeIcons.spinner),
            onTap: () {
              if (Theme.of(context).platform == TargetPlatform.android) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    icon: const FaIcon(FontAwesomeIcons.skull),
                    title: const Text("Are you sure?"),
                    content: const Text("Plx dont go"),
                    actions: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const FaIcon(FontAwesomeIcons.car),
                      ),
                      TextButton(
                        onPressed: () {
                          ref.read(authRepo).signOut();

                          context.go(LoginScreen.routeURL);
                        },
                        child: const Text("Yes"),
                      ),
                    ],
                  ),
                );
              } else {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text("Are you sure?"),
                    content: const Text("Plx dont go"),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("No"),
                      ),
                      CupertinoDialogAction(
                        onPressed: () {
                          ref.read(authRepo).signOut();
                          context.go(LoginScreen.routeURL);
                        },
                        isDestructiveAction: true,
                        child: const Text("Yes"),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
