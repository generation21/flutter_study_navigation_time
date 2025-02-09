import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_time/constant/gaps.dart';
import 'package:navigation_time/screens/home_screen/report_screen.dart';
import 'package:navigation_time/screens/home_screen/widgets/bottom_sheet_menu_item.dart';

class BottomSheetMenu extends StatelessWidget {
  const BottomSheetMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    void onReportTap(BuildContext context) {
      Navigator.of(context).pop();
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        showDragHandle: true,
        builder: (context) => const ReportScreen(),
      );
    }

    return Container(
      height: screenHeight / 3,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                BottomSheetMenuItem(
                  screenWidth: screenWidth,
                  text: "Unfollow",
                  textColor: Colors.black,
                  isUpper: true,
                  onTap: () {},
                ),
                Container(
                  width: screenWidth * 0.9,
                  height: 1,
                  color: Colors.grey.shade300,
                ),
                BottomSheetMenuItem(
                  screenWidth: screenWidth,
                  text: "Mute",
                  textColor: Colors.black,
                  isUpper: false,
                  onTap: () {},
                ),
              ],
            ),
            Gaps.v16,
            Column(
              children: [
                BottomSheetMenuItem(
                  screenWidth: screenWidth,
                  text: "Hide",
                  textColor: Colors.black,
                  isUpper: true,
                  onTap: () {},
                ),
                BottomSheetMenuItem(
                  screenWidth: screenWidth,
                  text: "Report",
                  textColor: Colors.red,
                  isUpper: false,
                  onTap: () => onReportTap(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
