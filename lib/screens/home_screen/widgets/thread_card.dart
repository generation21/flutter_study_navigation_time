import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_time/constant/gaps.dart';
import 'package:navigation_time/constant/sizes.dart';
import 'package:navigation_time/screens/home_screen/widgets/bottom_sheet_menu.dart';
import 'package:navigation_time/screens/home_screen/widgets/image_swaper_card.dart';
import 'package:navigation_time/screens/home_screen/widgets/reply_profiles.dart';

class ThreadCard extends StatelessWidget {
  final String username;
  final String profileImageUrl;
  final bool isCertified;
  final String time;
  final String description;
  final List<String> imageUrls;
  final List<String> replyProfiles;
  final int replyCount;
  final int likeCount;

  const ThreadCard({
    super.key,
    required this.username,
    required this.profileImageUrl,
    required this.isCertified,
    required this.time,
    required this.description,
    required this.imageUrls,
    required this.replyProfiles,
    required this.replyCount,
    required this.likeCount,
  });

  void _onSheetButtonPressed(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      showDragHandle: true,
      builder: (context) => const BottomSheetMenu(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size16,
        vertical: Sizes.size10,
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                            profileImageUrl,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(Sizes.size16),
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons.circlePlus,
                              color: Colors.black,
                              size: Sizes.size20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v10,
                    Expanded(
                      child: VerticalDivider(
                        color: Colors.grey.shade300,
                        thickness: 3,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: Sizes.size10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  username,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gaps.h5,
                                if (isCertified)
                                  const Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.certificate,
                                        color: Colors.blue,
                                        size: Sizes.size16,
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.check,
                                        color: Colors.white,
                                        size: Sizes.size8,
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  time,
                                ),
                                Gaps.h10,
                                GestureDetector(
                                    onTap: () => _onSheetButtonPressed(context),
                                    child: const FaIcon(
                                      FontAwesomeIcons.ellipsis,
                                    ))
                              ],
                            )
                          ],
                        ),
                        Text(
                          description,
                          maxLines: imageUrls.isNotEmpty ? 1 : 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Gaps.v10,
                        if (imageUrls.isNotEmpty)
                          ImageSwaperCard(imageUrls: imageUrls),
                        Gaps.v10,
                        const Row(
                          children: [
                            FaIcon(FontAwesomeIcons.heart),
                            Gaps.h20,
                            FaIcon(FontAwesomeIcons.comment),
                            Gaps.h20,
                            FaIcon(FontAwesomeIcons.retweet),
                            Gaps.h20,
                            FaIcon(FontAwesomeIcons.paperPlane),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gaps.v10,
          Row(
            children: [
              ReplyProfiles(
                replyCount: replyCount,
                replyProfiles: replyProfiles,
              ),
              Gaps.h10,
              Text(
                "$replyCount replies \u{00B7} $likeCount likes",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: Sizes.size16,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
