import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_time/constant/sizes.dart';

class ActivityIcon extends StatelessWidget {
  final String profileImageUrl;
  final String activityType;
  const ActivityIcon({
    super.key,
    required this.profileImageUrl,
    required this.activityType,
  });

  @override
  Widget build(BuildContext context) {
    IconData? icon;
    Color? color;
    if (activityType == "share") {
      icon = FontAwesomeIcons.share;
      color = Colors.blue;
    } else if (activityType == "repliy") {
      icon = FontAwesomeIcons.heart;
      color = Colors.red;
    }
    return Stack(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(
            profileImageUrl,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(Sizes.size4),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(Sizes.size10),
            ),
            child: const FaIcon(
              FontAwesomeIcons.share,
              color: Colors.white,
              size: Sizes.size10,
            ),
          ),
        ),
      ],
    );
  }
}
