import 'package:flutter/material.dart';
import 'package:navigation_time/constant/sizes.dart';

class ImageSwaperCard extends StatefulWidget {
  final List<String> imageUrls;
  const ImageSwaperCard({super.key, required this.imageUrls});

  @override
  State<ImageSwaperCard> createState() => _ImageSwaperCardState();
}

class _ImageSwaperCardState extends State<ImageSwaperCard>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late AnimationController _animationController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
    _animationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Sizes.size16),
      child: SizedBox(
        width: double.infinity,
        height: 250,
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          itemCount: widget.imageUrls.length,
          itemBuilder: (context, index) {
            return Image.asset(
              widget.imageUrls[index],
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
