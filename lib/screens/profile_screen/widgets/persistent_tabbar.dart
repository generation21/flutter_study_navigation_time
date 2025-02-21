import 'package:flutter/material.dart';
import 'package:navigation_time/constant/sizes.dart';
import 'package:navigation_time/view_models/dark_model_config_vm.dart';
import 'package:provider/provider.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: context.watch<DarkModeConfigViewModel>().isDarkMode
          ? Colors.black
          : Colors.white,
      child: Column(
        children: [
          TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: context.watch<DarkModeConfigViewModel>().isDarkMode
                ? Colors.white
                : Colors.black,
            labelPadding: const EdgeInsets.only(bottom: Sizes.size10),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: context.watch<DarkModeConfigViewModel>().isDarkMode
                ? Colors.white
                : Colors.black,
            labelStyle: const TextStyle(
                fontSize: Sizes.size20, fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.grey,
            tabs: [
              const Text("Threads"),
              const Text("Replies"),
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
    return true;
  }
}
