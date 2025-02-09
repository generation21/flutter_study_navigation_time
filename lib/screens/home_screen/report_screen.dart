import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_time/constant/gaps.dart';
import 'package:navigation_time/constant/sizes.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Report",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(color: Colors.grey.shade200),
            Expanded(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
                    child: Text(
                      "Why are you reporting this thread?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Gaps.v10,
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: Sizes.size20),
                    child: Text(
                      "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: Sizes.size14,
                      ),
                    ),
                  ),
                  Gaps.v10,
                  Divider(color: Colors.grey.shade200),
                  const ListTile(
                    title: Text("I Just don't like it"),
                    trailing: FaIcon(FontAwesomeIcons.chevronRight),
                  ),
                  Divider(color: Colors.grey.shade200),
                  const ListTile(
                    title: Text("It's unlawful content under NetzDG"),
                    trailing: FaIcon(FontAwesomeIcons.chevronRight),
                  ),
                  Divider(color: Colors.grey.shade200),
                  const ListTile(
                    title: Text("It's spam"),
                    trailing: FaIcon(FontAwesomeIcons.chevronRight),
                  ),
                  Divider(color: Colors.grey.shade200),
                  const ListTile(
                    title: Text("Hate speech or symbols"),
                    trailing: FaIcon(FontAwesomeIcons.chevronRight),
                  ),
                  Divider(color: Colors.grey.shade200),
                  const ListTile(
                    title: Text("Nudity or sexual activity"),
                    trailing: FaIcon(FontAwesomeIcons.chevronRight),
                  ),
                  Divider(color: Colors.grey.shade200),
                  const ListTile(
                    title: Text("False information"),
                    trailing: FaIcon(FontAwesomeIcons.chevronRight),
                  ),
                  Divider(color: Colors.grey.shade200),
                  const ListTile(
                    title: Text("Other"),
                    trailing: FaIcon(FontAwesomeIcons.chevronRight),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
