import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_time/constant/gaps.dart';
import 'package:navigation_time/constant/sizes.dart';
import 'package:navigation_time/screens/home_screen/widgets/thread_card.dart';
import 'package:navigation_time/screens/utils/appbar_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ThreadCard> _threadCards = [
    const ThreadCard(
      username: "pubity",
      profileImageUrl: "assets/profile_images/image1.jpeg",
      time: "2m",
      description: "Vine after seeing the Threads logo unveiled",
      imageUrls: [
        "assets/images/image1.jpg",
        "assets/images/image2.jpeg",
        "assets/images/image3.png",
      ],
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
      imageUrls: [
        "assets/images/image2.jpeg",
        "assets/images/image1.jpg",
      ],
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

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _threadCards.length,
      itemBuilder: (context, index) {
        return _threadCards[index];
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey.shade300,
          thickness: 1,
        );
      },
    );
  }
}
