import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import '/../../../generated/assets.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  final String background;

  const CustomScaffold(
      {Key? key, required this.child, this.background = Assets.imagesBg2})
      : super(key: key);

  factory CustomScaffold.withBg2({Key? key, required Widget child}) =>
      CustomScaffold(
        key: key,
        child: child,
        background: Assets.imagesBg2,
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          background,
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        FadedSlideAnimation(
          beginOffset: const Offset(0.0, 0.16),
          endOffset: Offset.zero,
          child: child,
        ),
      ],
    );
  }
}
