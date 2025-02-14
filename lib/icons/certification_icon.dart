import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_time/constant/sizes.dart';

class CertificationIcon extends StatelessWidget {
  final Color color;
  final double size;

  const CertificationIcon({super.key, Color? color, double? size})
      : color = color ?? Colors.blue,
        size = size ?? Sizes.size16;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        FaIcon(
          FontAwesomeIcons.certificate,
          color: color,
          size: size,
        ),
        const FaIcon(
          FontAwesomeIcons.check,
          color: Colors.white,
          size: Sizes.size8,
        ),
      ],
    );
  }
}
