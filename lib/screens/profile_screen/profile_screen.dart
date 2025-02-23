import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_time/constant/gaps.dart';
import 'package:navigation_time/constant/sizes.dart';
import 'package:navigation_time/screens/home_screen/widgets/reply_profiles.dart';
import 'package:navigation_time/screens/profile_screen/settings_screen.dart';
import 'package:navigation_time/screens/profile_screen/widgets/persistent_tabbar.dart';
import 'package:navigation_time/screens/profile_screen/widgets/replies_list.dart';
import 'package:navigation_time/utils.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = 'profile';
  static const String routeURL = '/profile';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onSettingsPressed() {
    context.go(SettingsScreen.routeURL);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const FaIcon(FontAwesomeIcons.boltLightning),
                centerTitle: false,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.instagram,
                      size: Sizes.size20,
                    ),
                  ),
                  IconButton(
                    onPressed: onSettingsPressed,
                    icon: const FaIcon(
                      FontAwesomeIcons.bars,
                      size: Sizes.size20,
                    ),
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
                  child: Column(
                    children: [
                      Gaps.v10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Jane",
                                style: TextStyle(
                                  fontSize: Sizes.size32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  const Text("jane_mobbin"),
                                  Gaps.h4,
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: Sizes.size12,
                                      vertical: Sizes.size4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isDarkMode(context)
                                          ? Colors.grey.shade800
                                          : Colors.grey.shade100,
                                      borderRadius:
                                          BorderRadius.circular(Sizes.size16),
                                    ),
                                    child: Text(
                                      "treads.net",
                                      style: TextStyle(
                                        color: isDarkMode(context)
                                            ? Colors.grey.shade400
                                            : Colors.grey.shade600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Gaps.v5,
                              const Text("Plant enthusiat!"),
                              Gaps.v5,
                              Row(
                                children: [
                                  const ReplyProfiles(
                                    replyProfiles: [
                                      "assets/images/image1.jpg",
                                      "assets/images/image2.jpeg",
                                    ],
                                    replyCount: 2,
                                  ),
                                  Gaps.h10,
                                  Text(
                                    "2 following",
                                    style: TextStyle(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            radius: Sizes.size24,
                            backgroundImage:
                                AssetImage("assets/images/image1.jpg"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade500,
                              ),
                              borderRadius: BorderRadius.circular(Sizes.size12),
                            ),
                            child: const Text(
                              "Edit profile",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size16,
                              ),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size8,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade500,
                                ),
                                borderRadius:
                                    BorderRadius.circular(Sizes.size12),
                              ),
                              child: const Text(
                                "Share profile",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size16,
                                ),
                              )),
                        ],
                      ),
                      Gaps.v10,
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              RepliesList(),
              RepliesList(),
            ],
          ),
        ),
      ),
    );
  }
}
