import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({
    Key? key,
    required this.image,
    required this.title,
    this.openContainer,
    this.isOpened = false,
    this.showSuffix = true,
  }) : super(key: key);

  final String image;
  final String title;
  final Widget? openContainer;
  final bool isOpened;
  final bool showSuffix;

  @override
  Widget build(BuildContext context) {
    if (openContainer != null) {
      return OpenContainer(
        closedBuilder: (context, action) => closedContainer(context),
        closedColor: Colors.transparent,
        closedElevation: 0,
        openBuilder: (context, action) => openContainer!,
        openColor: Colors.transparent,
        openElevation: 0,
      );
    } else {
      return closedContainer(context);
    }
  }

  ListTile closedContainer(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      leading: Image.asset(image, height: 24),
      contentPadding: const EdgeInsetsDirectional.only(end: 4),
      minLeadingWidth: 0,
      title: Text(
        title,
        style:
            theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: showSuffix
          ? IconButton(
              icon: Icon(isOpened ? Icons.close : Icons.view_day),
              color: isOpened ? theme.primaryColorLight : theme.disabledColor,
              iconSize: 20,
              onPressed: isOpened ? () => Navigator.pop(context) : null,
            )
          : null,
    );
  }
}
