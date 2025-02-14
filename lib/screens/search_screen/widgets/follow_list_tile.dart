import 'package:flutter/material.dart';
import 'package:navigation_time/constant/gaps.dart';
import 'package:navigation_time/constant/sizes.dart';
import 'package:navigation_time/icons/certification_icon.dart';

class FollowListTile extends StatelessWidget {
  final String username;
  final String profileImageUrl;
  final String channelName;
  final String followerCount;
  final bool isCertified;
  const FollowListTile({
    super.key,
    required this.username,
    required this.profileImageUrl,
    required this.channelName,
    required this.followerCount,
    required this.isCertified,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            backgroundImage: AssetImage(profileImageUrl),
          ),
          Gaps.h16,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.h5,
                  const CertificationIcon(),
                ],
              ),
              Text(channelName, style: const TextStyle(color: Colors.grey)),
              RichText(
                text: TextSpan(
                  text: followerCount,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(
                      text: " followers",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size24,
          vertical: Sizes.size10,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(Sizes.size12),
        ),
        child: const Text(
          "Follow",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
