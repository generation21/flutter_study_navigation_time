import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_time/constant/gaps.dart';
import 'package:navigation_time/constant/sizes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';
import 'package:navigation_time/screens/camera_screen/camera_screen.dart'; // 카메라 페이지가 lib/camera_page.dart에 있다고 가정

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

  // 추가: 선택 또는 촬영한 이미지를 저장할 변수
  File? _selectedImage;

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

    textPainter.layout(maxWidth: availableWidth);

    return textPainter.computeLineMetrics().length;
  }

  // 갤러리에서 이미지 선택
  Future<void> _pickImageFromGallery() async {
    // 갤러리 접근 권한 요청
    PermissionStatus status = await Permission.photos.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('갤러리 접근 권한이 필요합니다.')),
      );
      return;
    }

    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
    );
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // 카메라로 사진 촬영
  Future<void> _takePhoto() async {
    // 카메라 접근 권한 요청
    PermissionStatus permission = await Permission.camera.request();

    // 권한이 거부된 경우
    if (permission.isDenied || permission.isPermanentlyDenied) {
      // 만약 사용자가 '다시 묻지 않음'을 선택했다면 앱 설정을 열도록 유도합니다.
      if (permission.isPermanentlyDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('카메라 권한이 영구적으로 거부되었습니다.\n설정에서 권한을 허용해주세요.')),
        );
        openAppSettings();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('카메라 접근 권한이 필요합니다.')),
        );
      }
      return;
    }

    // 사용 가능한 카메라 조회 후, 사진 촬영 페이지로 이동
    final availableCams = await availableCameras();
    if (availableCams.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('사용 가능한 카메라가 없습니다.')),
      );
      return;
    }

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(camera: availableCams.first),
      ),
    );
    if (result != null) {
      setState(() {
        _selectedImage = File(result);
      });
    }
  }

  // 하단 시트에서 카메라/갤러리 선택 옵션 제공
  void _showImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('갤러리 선택'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImageFromGallery();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('카메라 촬영'),
                onTap: () {
                  Navigator.of(context).pop();
                  _takePhoto();
                },
              ),
            ],
          ),
        );
      },
    );
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
                              if (_selectedImage != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      _selectedImage!,
                                      width: size.width,
                                      height: size.width * 0.6,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              GestureDetector(
                                onTap: _showImagePicker,
                                child: const FaIcon(
                                  FontAwesomeIcons.paperclip,
                                  size: Sizes.size20,
                                  color: Colors.grey,
                                ),
                              ),
                              Gaps.v10,
                              // 선택한 이미지 미리보기 (있을 때만)
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
