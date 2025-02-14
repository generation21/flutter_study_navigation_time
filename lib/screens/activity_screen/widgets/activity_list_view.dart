import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_time/constant/gaps.dart';
import 'package:navigation_time/constant/sizes.dart';
import 'package:navigation_time/screens/activity_screen/activity_screen.dart';

class ActivityListView extends StatelessWidget {
  final ActivityType activityType;
  final String profileImageUrl;
  final String username;
  final String activityTime;

  final Map<ActivityType, String> acivitySubTitle = {
    ActivityType.replies: "Starting out my gardening club with threads",
    ActivityType.metions: "Mentioned you",
    ActivityType.likes: "Definityly broken",
    ActivityType.follows: "Followed you",
  };

  ActivityListView({
    super.key,
    required this.activityType,
    required this.profileImageUrl,
    required this.username,
    required this.activityTime,
  });

  Map<ActivityType, FaIcon> activityIcon = {
    ActivityType.replies: const FaIcon(
      FontAwesomeIcons.reply,
      size: Sizes.size10,
      color: Colors.white,
    ),
    ActivityType.metions: const FaIcon(
      FontAwesomeIcons.threads,
      size: Sizes.size10,
      color: Colors.white,
    ),
    ActivityType.likes: const FaIcon(
      FontAwesomeIcons.heartCrack,
      size: Sizes.size10,
      color: Colors.white,
    ),
    ActivityType.follows: const FaIcon(
      FontAwesomeIcons.user,
      size: Sizes.size10,
      color: Colors.white,
    ),
  };

  Map<ActivityType, Color> iconColor = {
    ActivityType.replies: Colors.blue,
    ActivityType.metions: Colors.green,
    ActivityType.likes: Colors.red,
    ActivityType.follows: Colors.purple,
  };

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
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
                    color: iconColor[activityType],
                    borderRadius: BorderRadius.circular(Sizes.size10),
                  ),
                  child: activityIcon[activityType],
                ),
              ),
            ],
          ),
          Gaps.h16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(username),
                    Gaps.h5,
                    Text(activityTime),
                  ],
                ),
                Text(
                  acivitySubTitle[activityType]!,
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                activityType == ActivityType.metions
                    ? const Text(
                        "Here's a thread you should follow if you love botny @jane_mobbin")
                    : const SizedBox.shrink(),
              ],
            ),
          )
        ],
      ),
      trailing: activityType == ActivityType.follows
          ? Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size20,
                vertical: Sizes.size8,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 2),
                borderRadius: BorderRadius.circular(Sizes.size10),
              ),
              child: Text(
                "Following",
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: Sizes.size14,
                    fontWeight: FontWeight.bold),
              ),
            )
          : null,
    );
  }
}
