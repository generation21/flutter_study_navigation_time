import 'package:flutter/material.dart';
import 'package:navigation_time/constant/gaps.dart';
import 'package:navigation_time/screens/home_screen/widgets/thread_card.dart';

class RepliesList extends StatelessWidget {
  final List<ThreadCard> _threadCards = [
    const ThreadCard(
      username: "pubity",
      profileImageUrl: "assets/profile_images/image1.jpeg",
      time: "2m",
      description: "Vine after seeing the Threads logo unveiled",
      imageUrls: [],
      replyCount: 10,
      likeCount: 10,
      replyProfiles: [
        "assets/profile_images/image1.jpeg",
        "assets/profile_images/image2.jpeg",
        "assets/profile_images/image3.jpeg",
      ],
      isCertified: true,
    ),
    const ThreadCard(
      username: "thetindeerblog",
      profileImageUrl: "assets/profile_images/image2.jpeg",
      time: "5m",
      description:
          "if you're reading this, go water that thirsty plant. You're welcome",
      imageUrls: [],
      replyCount: 1,
      likeCount: 56,
      replyProfiles: [
        "assets/profile_images/image3.jpeg",
      ],
      isCertified: false,
    ),
    const ThreadCard(
      username: "pubity",
      profileImageUrl: "assets/profile_images/image3.jpeg",
      time: "2m",
      description:
          "my phone feals like a vibrator with all these notifications rn",
      imageUrls: [],
      replyCount: 2,
      likeCount: 198,
      replyProfiles: [
        "assets/profile_images/image3.jpeg",
        "assets/profile_images/image2.jpeg",
      ],
      isCertified: true,
    ),
  ];

  RepliesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => _threadCards[index],
      separatorBuilder: (context, index) => Gaps.v10,
      itemCount: _threadCards.length,
    );
  }
}
