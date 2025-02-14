import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_time/constant/gaps.dart';
import 'package:navigation_time/constant/sizes.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
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
          ListTile(
            title: const Text("Private profile"),
            leading: const FaIcon(FontAwesomeIcons.lock),
            trailing: Switch.adaptive(
              value: _notifications,
              onChanged: _onNotificationsChanged,
              activeColor: Colors.black,
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.userCheck),
            title: const Text("Mentions"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Everyone",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                Gaps.h10,
                FaIcon(
                  FontAwesomeIcons.angleRight,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.bellSlash),
            title: const Text("Mute"),
            trailing: FaIcon(
              FontAwesomeIcons.angleRight,
              color: Colors.grey.shade500,
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.eyeSlash),
            title: const Text("Hidden Words"),
            trailing: FaIcon(
              FontAwesomeIcons.angleRight,
              color: Colors.grey.shade500,
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.userGroup),
            title: const Text("Profiles you follow"),
            trailing: FaIcon(
              FontAwesomeIcons.angleRight,
              color: Colors.grey.shade500,
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.bellSlash),
            title: const Text("Mute"),
            trailing: FaIcon(
              FontAwesomeIcons.angleRight,
              color: Colors.grey.shade500,
            ),
          ),
          Divider(
            height: Sizes.size1,
            thickness: Sizes.size1,
            color: Colors.grey.shade300,
          ),
          Gaps.v12,
          ListTile(
            title: const Text("Other privacy settings"),
            subtitle: const Text(
                "Some settings, like restrict, apply to both Threads and Instagram and can be managaged on Instagram."),
            trailing: FaIcon(
              FontAwesomeIcons.shareFromSquare,
              color: Colors.grey.shade500,
            ),
            isThreeLine: true,
          ),
          ListTile(
            title: const Text("Blocked profiles"),
            leading: const FaIcon(FontAwesomeIcons.circleXmark),
            trailing: FaIcon(
              FontAwesomeIcons.shareFromSquare,
              color: Colors.grey.shade500,
            ),
          ),
          ListTile(
            title: const Text("Hide likes"),
            leading: const FaIcon(FontAwesomeIcons.phoneSlash),
            trailing: FaIcon(
              FontAwesomeIcons.shareFromSquare,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
