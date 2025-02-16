import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreen({super.key, required this.camera});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraDescription _currentCamera;
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isFlashOn = false;

  @override
  void initState() {
    super.initState();
    _currentCamera = widget.camera;
    _controller = CameraController(_currentCamera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 플래시 토글 함수
  Future<void> _toggleFlash() async {
    try {
      if (_isFlashOn) {
        await _controller.setFlashMode(FlashMode.off);
      } else {
        await _controller.setFlashMode(FlashMode.always);
      }
      setState(() {
        _isFlashOn = !_isFlashOn;
      });
    } catch (e) {
      print('플래시 전환 에러: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('플래시 전환 중 오류 발생: $e')),
      );
    }
  }

  // 카메라 전환(회전) 함수
  Future<void> _switchCamera() async {
    try {
      // availableCameras()를 이용해 기기에 연결된 카메라 목록을 가져옵니다.
      final cameras = await availableCameras();

      if (cameras.length > 1) {
        CameraDescription newCamera;
        // 현재 사용 중인 카메라와 다른 카메라로 전환합니다.
        if (_currentCamera == cameras.first) {
          newCamera = cameras.last;
        } else {
          newCamera = cameras.first;
        }
        await _controller.dispose();
        setState(() {
          _currentCamera = newCamera;
          _isFlashOn = false; // 전환 시 플래시 상태 초기화
          _controller =
              CameraController(_currentCamera, ResolutionPreset.medium);
          _initializeControllerFuture = _controller.initialize();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('사용 가능한 다른 카메라가 없습니다.')),
        );
      }
    } catch (e) {
      print('카메라 전환 에러: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('카메라 전환 중 오류 발생: $e')),
      );
    }
  }

  // 사진 촬영 함수
  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final XFile picture = await _controller.takePicture();
      Navigator.pop(context, picture.path);
    } catch (e) {
      print('사진 촬영 에러: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('사진 촬영 중 오류 발생: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                // 카메라 프리뷰
                CameraPreview(_controller),
                // 상단 좌측: Back 버튼 (SafeArea 적용)
                SafeArea(
                  child: Positioned(
                    top: 16,
                    left: 16,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.white, size: 30),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                // 하단 중앙: 플래시 버튼, 촬영 버튼, 카메라 전환 버튼
                Positioned(
                  bottom: 32,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 플래시 버튼 (촬영 버튼 왼쪽)
                      IconButton(
                        icon: Icon(
                          _isFlashOn ? Icons.flash_on : Icons.flash_off,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: _toggleFlash,
                      ),
                      const SizedBox(width: 40),
                      // 촬영 버튼 (중앙)
                      GestureDetector(
                        onTap: _takePicture,
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1),
                            color: Colors.transparent,
                          ),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      // 카메라 전환 버튼 (촬영 버튼 오른쪽)
                      IconButton(
                        icon: const Icon(Icons.cameraswitch,
                            color: Colors.white, size: 30),
                        onPressed: _switchCamera,
                      ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
