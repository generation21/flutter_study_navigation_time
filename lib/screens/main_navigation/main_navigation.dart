import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_time/constant/sizes.dart';
import 'package:navigation_time/screens/activity_screen/activity_screen.dart';
import 'package:navigation_time/screens/home_screen/home_screen.dart';
import 'package:navigation_time/screens/main_navigation/widgets/nav_tab.dart';
import 'package:navigation_time/screens/profile_screen/profile_screen.dart';
import 'package:navigation_time/screens/profile_screen/profile_tab_navigator.dart';
import 'package:navigation_time/screens/search_screen/search_screen.dart';
import 'package:navigation_time/screens/write_screen/write_screen.dart';
import 'package:navigation_time/screens/utils/appbar_icon.dart';
import 'package:navigation_time/utils.dart';

class MainNavigation extends StatefulWidget {
  final String tab;
  const MainNavigation({super.key, required this.tab});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final List<String> _tabs = [
    "home",
    "search",
    "write",
    "activity",
    "profile",
    "settings",
    "privacy",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    if (index == 2) {
      _onWriteTap();
      return;
    }

    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onWriteTap() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) => const WriteScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _selectedIndex == 0 || _selectedIndex == 2
            ? AppBar(
                title: const AppbarIcon(),
              )
            : null,
        body: Stack(
          children: [
            Offstage(
              offstage: _selectedIndex != 0,
              child: const HomeScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 1,
              child: const SearchScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 2,
              child: Container(),
            ),
            Offstage(
              offstage: _selectedIndex != 3,
              child: const ActivityScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 4 &&
                  _selectedIndex != 5 &&
                  _selectedIndex != 6,
              child: ProfileTabNavigator(tab: _tabs[_selectedIndex]),
            ),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: isDarkMode(context)
                          ? Colors.grey.shade800
                          : Colors.grey.shade300),
                ),
              ),
            ),
            BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NavTab(
                      isSelected: _selectedIndex == 0,
                      onTap: () => _onTap(0),
                      icon: FontAwesomeIcons.house,
                    ),
                    NavTab(
                      isSelected: _selectedIndex == 1,
                      onTap: () => _onTap(1),
                      icon: FontAwesomeIcons.magnifyingGlass,
                    ),
                    NavTab(
                      isSelected: _selectedIndex == 2,
                      onTap: () => _onTap(2),
                      icon: FontAwesomeIcons.solidPenToSquare,
                    ),
                    NavTab(
                      isSelected: _selectedIndex == 3,
                      onTap: () => _onTap(3),
                      icon: FontAwesomeIcons.heart,
                    ),
                    NavTab(
                      isSelected: _selectedIndex == 4,
                      onTap: () => _onTap(4),
                      icon: FontAwesomeIcons.user,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
