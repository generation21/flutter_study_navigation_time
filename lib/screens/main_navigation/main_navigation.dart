import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_time/constant/sizes.dart';
import 'package:navigation_time/screens/home_screen/home_screen.dart';
import 'package:navigation_time/screens/main_navigation/widgets/nav_tab.dart';
import 'package:navigation_time/screens/utils/appbar_icon.dart';
import 'package:navigation_time/screens/write_screen/write_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    if (index == 2) {
      _onWriteTap();
      return;
    }
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
        appBar: AppBar(
          title: const AppbarIcon(),
        ),
        body: Stack(
          children: [
            Offstage(
              offstage: _selectedIndex != 0,
              child: const HomeScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 1,
              child: Container(
                color: Colors.white,
              ),
            ),
            Offstage(
              offstage: _selectedIndex != 2,
              child: Container(),
            ),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            BottomAppBar(
              color: Colors.white,
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
