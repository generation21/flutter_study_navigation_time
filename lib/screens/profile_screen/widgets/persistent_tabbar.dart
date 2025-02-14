import 'package:flutter/material.dart';
import 'package:navigation_time/constant/sizes.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: Colors.black,
            labelPadding: EdgeInsets.only(bottom: Sizes.size10),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.black,
            labelStyle:
                TextStyle(fontSize: Sizes.size20, fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Text("Threads"),
              Text("Replies"),
            ],
          ),
          Divider(height: Sizes.size1, color: Colors.grey.shade300),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 56;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
