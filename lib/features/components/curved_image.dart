import 'package:flutter/material.dart';

class CurvedImage extends StatelessWidget {
  const CurvedImage({
    Key? key,
    required this.image,
    this.radius = 16,
    this.height,
    this.width,
    this.borderRadius,
  }) : super(key: key);

  final String image;
  final BorderRadius? borderRadius;
  final double radius;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(radius),
      child: Image.asset(
        image,
        fit: BoxFit.fill,
        width: width,
        height: height ?? double.maxFinite,
      ),
    );
  }
}
