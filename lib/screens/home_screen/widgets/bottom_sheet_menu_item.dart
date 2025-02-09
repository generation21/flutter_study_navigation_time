import 'package:flutter/material.dart';
import 'package:navigation_time/constant/sizes.dart';

class BottomSheetMenuItem extends StatelessWidget {
  final double screenWidth;
  final String text;
  final Color textColor;
  final bool isUpper;
  final VoidCallback onTap;

  const BottomSheetMenuItem({
    super.key,
    required this.screenWidth,
    required this.text,
    required this.textColor,
    required this.isUpper,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.9,
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size16,
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
          borderRadius: isUpper
              ? const BorderRadius.only(
                  topLeft: Radius.circular(Sizes.size16),
                  topRight: Radius.circular(Sizes.size16),
                )
              : const BorderRadius.only(
                  bottomLeft: Radius.circular(Sizes.size16),
                  bottomRight: Radius.circular(Sizes.size16),
                ),
          color: Colors.grey.shade200,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
