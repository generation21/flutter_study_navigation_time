import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_time/constant/sizes.dart';
import 'package:navigation_time/view_models/dark_model_config_vm.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Consumer(
      builder: (context, ref, child) {
        final isDarkMode = ref.watch(darkModeConfigProvider).isDarkMode;
        return Container(
          color: isDarkMode ? Colors.black : Colors.white,
          child: Column(
            children: [
              TabBar(
                dividerColor: Colors.transparent,
                indicatorColor: isDarkMode ? Colors.white : Colors.black,
                labelPadding: const EdgeInsets.only(bottom: Sizes.size10),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: isDarkMode ? Colors.white : Colors.black,
                labelStyle: const TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Text("Threads"),
                  Text("Replies"),
                ],
              ),
              Divider(
                height: Sizes.size1,
                color: Colors.grey.shade300,
              ),
            ],
          ),
        );
      },
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
