import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_time/constant/sizes.dart';
import 'package:navigation_time/screens/profile_screen/privacy_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
              onPressed: () => Navigator.of(context).pop(),
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
            onTap: () => Navigator.of(context).pushNamed('/privacy'),
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
                        onPressed: () => Navigator.of(context).pop(),
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
                        onPressed: () => Navigator.of(context).pop(),
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
