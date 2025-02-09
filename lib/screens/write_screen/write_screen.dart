import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_time/constant/gaps.dart';
import 'package:navigation_time/constant/sizes.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final double _lineHeight = 20.0;
  int lineCount = 1;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        lineCount = _textEditingController.text.split('\n').length;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  int computeLineCount(double availableWidth) {
    // 텍스트가 비어있다면 최소 1줄이라 가정합니다.
    if (_textEditingController.text.isEmpty) {
      return 1;
    }

    final textPainter = TextPainter(
      text: TextSpan(
        text: _textEditingController.text,
      ),
      textDirection: TextDirection.ltr,
      maxLines: null,
    );

    // 최대 너비를 지정하여 layout을 진행합니다.
    textPainter.layout(maxWidth: availableWidth);

    // 라인마다의 metrics를 가져온 후 전체 줄 수 계산
    return textPainter.computeLineMetrics().length;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.9,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          leadingWidth: 80,
          leading: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(left: Sizes.size16),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          title: const Text(
            'New thread',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(Sizes.size16),
              child: LayoutBuilder(builder: (context, constraints) {
                double availableTextWidth = constraints.maxWidth - (2 + 8);
                int lineCount = computeLineCount(availableTextWidth);
                double containerHeight = lineCount * _lineHeight;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                            "assets/profile_images/image1.jpeg",
                          ),
                        ),
                        Gaps.v10,
                        Container(
                          color: Colors.grey.shade300,
                          width: 2,
                          height: lineCount * _lineHeight,
                        ),
                        Gaps.v10,
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.white.withAlpha(100),
                            BlendMode.lighten,
                          ),
                          child: const CircleAvatar(
                            radius: 10,
                            backgroundImage: AssetImage(
                              "assets/profile_images/image1.jpeg",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.h10,
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "jane_mobbin",
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextField(
                            controller: _textEditingController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Start a thread...",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: Sizes.size16,
                              ),
                            ),
                            cursorColor: Colors.blue,
                          ),
                          const FaIcon(FontAwesomeIcons.paperclip,
                              color: Colors.grey, size: Sizes.size16)
                        ],
                      ),
                    )
                  ],
                );
              }),
            ),
            Positioned(
              bottom: 0,
              width: size.width,
              child: BottomAppBar(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Anyone can reply",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text("Post",
                        style: TextStyle(
                          color: _textEditingController.text.isEmpty
                              ? Colors.blue.shade200
                              : Colors.blue,
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
