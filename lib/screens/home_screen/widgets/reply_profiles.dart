import 'package:flutter/material.dart';

class ReplyProfiles extends StatelessWidget {
  final int replyCount;
  final List<String> replyProfiles;
  const ReplyProfiles({
    super.key,
    required this.replyCount,
    required this.replyProfiles,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: _buildProfileStack(),
    );
  }

  Widget _buildProfileStack() {
    if (replyCount >= 3) {
      return Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              radius: 10,
              backgroundImage: AssetImage(replyProfiles[0]),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage(replyProfiles[1]),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CircleAvatar(
              radius: 8,
              backgroundImage: AssetImage(replyProfiles[2]),
            ),
          ),
        ],
      );
    } else if (replyCount == 2) {
      return Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage(replyProfiles[0]),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage(replyProfiles[1]),
            ),
          ),
        ],
      );
    } else if (replyCount == 1) {
      return Center(
        child: CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage(replyProfiles[0]),
        ),
      );
    }

    return const SizedBox();
  }
}
