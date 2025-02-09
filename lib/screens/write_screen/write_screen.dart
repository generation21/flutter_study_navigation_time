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
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  int lineCount = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
    _textEditingController.addListener(() {
      setState(() {
        lineCount = _textEditingController.text.split('\n').length;
      });
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    _scrollController.dispose();
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
      height: size.height * 0.8,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
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
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            const CircleAvatar(
                              radius: Sizes.size20,
                              backgroundImage: AssetImage(
                                "assets/profile_images/image1.jpeg",
                              ),
                            ),
                            Gaps.v10,
                            Expanded(
                              child: Container(
                                width: Sizes.size2,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            Gaps.v10,
                            const FaIcon(
                              FontAwesomeIcons.clipboard,
                              size: Sizes.size20,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        Gaps.h10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "lakers",
                                style: TextStyle(
                                  fontSize: Sizes.size12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextField(
                                controller: _textEditingController,
                                autocorrect: false,
                                focusNode: _focusNode,
                                maxLines: null,
                                minLines: null,
                                textInputAction: TextInputAction.newline,
                                decoration: const InputDecoration(
                                  hintText: 'Start a thread...',
                                  hintStyle: TextStyle(
                                    fontSize: Sizes.size12,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                              Gaps.v10,
                              const FaIcon(
                                FontAwesomeIcons.paperclip,
                                size: Sizes.size20,
                                color: Colors.grey,
                              ),
                              Gaps.v32,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gaps.v44,
              ],
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
              vertical: Sizes.size16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Anyone can reply',
                  style: TextStyle(
                    fontSize: Sizes.size12,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade700,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    'Post',
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
