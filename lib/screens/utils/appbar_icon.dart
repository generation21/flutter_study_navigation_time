import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_time/constant/sizes.dart';

class AppbarIcon extends StatelessWidget {
  const AppbarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      FontAwesomeIcons.threads,
      color: Theme.of(context).primaryColor,
      size: Sizes.size36,
    );
  }
}
