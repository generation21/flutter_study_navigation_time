import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_time/constant/gaps.dart';
import 'package:navigation_time/constant/sizes.dart';
import 'package:navigation_time/screens/activity_screen/widgets/activity_list_view.dart';

enum ActivityType { replies, metions, likes, follows }

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: ActivityType.values.length + 1, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> _getFilteredActivityList(ActivityType? type) {
    if (type == null) {
      return activityList;
    }
    return activityList
        .where((activity) => activity["activityType"] == type)
        .toList();
  }

  // 전달받은 리스트를 이용해 ListView.separated를 반환하는 메서드
  Widget _buildActivityList(List<Map<String, dynamic>> list) {
    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        indent: Sizes.size64,
      ),
      itemBuilder: (context, index) {
        final activity = list[index];
        return ActivityListView(
          profileImageUrl: activity["profileImageUrl"],
          username: activity["username"],
          activityTime: activity["activityTime"],
          activityType: activity["activityType"],
        );
      },
    );
  }

  List<Map<String, dynamic>> activityList = [
    {
      "profileImageUrl": "assets/profile_images/image1.jpeg",
      "username": "John_mobbin",
      "activityTime": "5h",
      "activityType": ActivityType.replies,
    },
    {
      "profileImageUrl": "assets/profile_images/image1.jpeg",
      "username": "John_mobbin",
      "activityTime": "4h",
      "activityType": ActivityType.metions,
    },
    {
      "profileImageUrl": "assets/profile_images/image3.jpeg",
      "username": "the.plantdads",
      "activityTime": "1h",
      "activityType": ActivityType.follows,
    },
    {
      "profileImageUrl": "assets/profile_images/image3.jpeg",
      "username": "the.plantdads",
      "activityTime": "1h",
      "activityType": ActivityType.likes,
    },
    {
      "profileImageUrl": "assets/profile_images/image2.jpeg",
      "username": "thebaerryjungle",
      "activityTime": "3h",
      "activityType": ActivityType.likes,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Activity"),
          centerTitle: false,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size32,
            color: Colors.black,
          ),
          bottom: TabBar(
            padding: EdgeInsets.zero,
            dividerHeight: 0,
            tabAlignment: TabAlignment.start,
            controller: _tabController,
            labelColor: Colors.white,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            labelPadding: const EdgeInsets.symmetric(horizontal: Sizes.size4),
            splashFactory: NoSplash.splashFactory,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.transparent,
            indicator: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(Sizes.size12),
            ),
            unselectedLabelColor: Colors.black,
            tabs: [
              Container(
                width: Sizes.size96,
                decoration: _tabController.index != 0
                    ? BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(Sizes.size12),
                      )
                    : null,
                child: const Tab(text: "All", height: Sizes.size40),
              ),
              ...ActivityType.values.asMap().entries.map((entry) {
                final index = entry.key;
                final e = entry.value;
                return Container(
                  width: Sizes.size96,
                  decoration: _tabController.index != index + 1
                      ? BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(Sizes.size12),
                        )
                      : null,
                  child: Tab(text: e.name, height: Sizes.size40),
                );
              }),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildActivityList(_getFilteredActivityList(null)),
            _buildActivityList(_getFilteredActivityList(ActivityType.replies)),
            _buildActivityList(_getFilteredActivityList(ActivityType.metions)),
            _buildActivityList(_getFilteredActivityList(ActivityType.likes)),
            _buildActivityList(_getFilteredActivityList(ActivityType.follows)),
          ],
        ),
      ),
    );
  }
}
