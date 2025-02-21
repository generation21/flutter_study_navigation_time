import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_time/constant/gaps.dart';
import 'package:navigation_time/constant/sizes.dart';
import 'package:navigation_time/icons/certification_icon.dart';
import 'package:navigation_time/screens/search_screen/widgets/follow_list_tile.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search';

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, dynamic>> _items = [
    {
      'username': 'rjmithun',
      'profileImageUrl': 'assets/profile_images/image1.jpeg',
      'channelName': 'Mithun',
      'followerCount': '26.6K',
      'isCertified': true,
    },
    {
      'username': 'rjmithun',
      'profileImageUrl': 'assets/profile_images/image1.jpeg',
      'channelName': 'Mithun',
      'followerCount': '26.6K',
      'isCertified': true,
    },
    {
      'username': 'vicenews',
      'profileImageUrl': 'assets/profile_images/image2.jpeg',
      'channelName': 'VICE NEWs',
      'followerCount': '301K',
      'isCertified': true,
    },
    {
      'username': 'rjmithun',
      'profileImageUrl': 'assets/profile_images/image3.jpeg',
      'channelName': 'Mithun',
      'followerCount': '26.6K',
      'isCertified': true,
    },
    {
      'username': 'sebin_cyriac',
      'profileImageUrl': 'assets/profile_images/image1.jpeg',
      'channelName': 'Sebin',
      'followerCount': '26.6K',
      'isCertified': true,
    },
    {
      'username': 'chef_pillai',
      'profileImageUrl': 'assets/profile_images/image3.jpeg',
      'channelName': 'Chef Pillai',
      'followerCount': '130K',
      'isCertified': true,
    },
    {
      'username': 'malalala',
      'profileImageUrl': 'assets/profile_images/image2.jpeg',
      'channelName': 'Malala Yousafzai',
      'followerCount': '23K',
      'isCertified': true,
    },
    {
      'username': 'condenasttraveller',
      'profileImageUrl': 'assets/profile_images/image1.jpeg',
      'channelName': 'Condé Nast Traveller',
      'followerCount': '11K',
      'isCertified': true,
    },
    {
      'username': 'general_knowledge',
      'profileImageUrl': 'assets/profile_images/image2.jpeg',
      'channelName': 'General Knowledge',
      'followerCount': '2K',
      'isCertified': true,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
        child: ListView.builder(
          itemCount: _items.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: Sizes.size12),
                child: Text(
                  "Search",
                  style: TextStyle(
                    fontSize: Sizes.size32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else if (index == 1) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: Sizes.size12),
                child: CupertinoSearchTextField(),
              );
            }
            return FollowListTile(
              username: _items[index - 2]['username'],
              profileImageUrl: _items[index - 2]['profileImageUrl'],
              channelName: _items[index - 2]['channelName'],
              followerCount: _items[index - 2]['followerCount'],
              isCertified: _items[index - 2]['isCertified'],
            );
          },
        ),
      ),
    );
  }
}
