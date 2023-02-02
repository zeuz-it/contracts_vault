import 'package:animations/animations.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import '/../../../core/custom_direction.dart';
import '/../../../features/components/curved_image.dart';
import '../../media.dart';
import '../../title_row.dart';
import '/../../../features/media/ui/media_info_page.dart';
import '/../../../features/seller/ui/seller_row.dart';
import '/../../../generated/assets.dart';
import '/../../../generated/l10n.dart';

class MediaCard extends StatelessWidget {
  const MediaCard({
    Key? key,
    required this.media,
    required this.titleImage,
    required this.title,
    required this.direction,
  }) : super(key: key);

  final Media media;
  final String titleImage;
  final String title;
  final CustomDirection direction;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (context, action) => ClosedMediaCard(
        media: media,
        direction: direction,
      ),
      closedColor: Colors.transparent,
      closedElevation: 0,
      openBuilder: (context, action) => MediaInfoPage(media: media),
      openColor: Colors.transparent,
      openElevation: 0,
    );
  }
}

class ClosedMediaCard extends StatelessWidget {
  const ClosedMediaCard({
    Key? key,
    required this.media,
    required this.direction,
    this.padding,
  }) : super(key: key);

  final Media media;
  final CustomDirection direction;
  final EdgeInsetsGeometry? padding;

  EdgeInsetsGeometry get _padding {
    if (padding != null) return padding!;
    switch (direction) {
      case CustomDirection.horizontal:
        return const EdgeInsetsDirectional.only(end: 12);
      case CustomDirection.vertical:
        return const EdgeInsetsDirectional.only(end: 20, bottom: 12);
    }
  }

  double _height(Size size) {
    switch (direction) {
      case CustomDirection.horizontal:
        return size.height * 0.3;
      case CustomDirection.vertical:
        return size.height * 0.48;
    }
  }

  double _width(Size size) {
    switch (direction) {
      case CustomDirection.horizontal:
        return size.width * 0.5;
      case CustomDirection.vertical:
        return size.width;
    }
  }

  double get frostedHeight {
    switch (direction) {
      case CustomDirection.horizontal:
        return 60;
      case CustomDirection.vertical:
        return 72;
    }
  }

  TextStyle? getNameTextStyle(ThemeData theme) {
    switch (direction) {
      case CustomDirection.horizontal:
        return theme.textTheme.titleMedium;
      case CustomDirection.vertical:
        return theme.textTheme.headlineSmall;
    }
  }

  TextStyle? getFirstRowTextStyle(ThemeData theme) {
    TextStyle? textStyle;
    switch (direction) {
      case CustomDirection.horizontal:
        textStyle = theme.textTheme.labelSmall;
        break;
      case CustomDirection.vertical:
        textStyle = theme.textTheme.bodyMedium;
        break;
    }
    return textStyle!.copyWith(color: theme.primaryColorLight.withOpacity(0.7));
  }

  TextStyle? getSecondRowTextStyle(ThemeData theme) {
    switch (direction) {
      case CustomDirection.horizontal:
        return theme.textTheme.bodySmall;
      case CustomDirection.vertical:
        return theme.textTheme.titleMedium!.copyWith(fontSize: 18);
    }
  }

  double get textPadding {
    switch (direction) {
      case CustomDirection.horizontal:
        return 10;
      case CustomDirection.vertical:
        return 16;
    }
  }

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    var height = _height(size);
    var width = _width(size);
    return Container(
      margin: _padding,
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CurvedImage(
            image: media.image,
            width: width,
            radius: 18,
          ),
          Positioned(
            bottom: 60,
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    theme.hintColor.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: frostedHeight + 12,
            left: textPadding,
            right: textPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  media.name,
                  style: getNameTextStyle(theme),
                ),
                Icon(
                  media.isFavourite ? Icons.favorite : Icons.favorite_border,
                  size: 16,
                  color: theme.primaryColorLight,
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "@" + media.seller.userName,
                    style: getFirstRowTextStyle(theme),
                  ),
                  Text(
                    s.highestBid,
                    style: getFirstRowTextStyle(theme),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    media.timeLeft,
                    style: getSecondRowTextStyle(theme),
                  ),
                  const Spacer(),
                  Image.asset(Assets.iconsNft, height: 12),
                  const SizedBox(width: 6),
                  Text(
                    media.highestBid.toStringAsFixed(2),
                    style: getSecondRowTextStyle(theme),
                  ),
                ],
              )
            ],
          ).frosted(
            padding: EdgeInsets.symmetric(horizontal: textPadding, vertical: 8),
            height: frostedHeight,
            width: width,
            frostColor: theme.dividerColor,
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(16)),
            blur: 7,
          )
        ],
      ),
    );
  }
}

class OpenedMediaCard extends StatelessWidget {
  const OpenedMediaCard({
    Key? key,
    required this.media,
    required this.titleImage,
    required this.title,
  }) : super(key: key);
  final Media media;
  final String titleImage;
  final String title;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var disabledColor = theme.primaryColorLight.withOpacity(0.8);
    return Stack(
      children: [
        Image.asset(
          media.image,
          height: size.height,
          width: size.width,
          fit: BoxFit.fill,
        ),
        Column(
          children: [
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 20.0, end: 4),
              child: TitleRow(
                image: titleImage,
                title: title,
                isOpened: true,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        media.name,
                        style: theme.textTheme.headlineSmall,
                      ),
                      Icon(
                        media.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: theme.primaryColorLight,
                      )
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    media.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: disabledColor,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SellerRow(media: media),
                  const SizedBox(height: 4),
                ],
              ).frosted(
                padding: const EdgeInsets.all(16),
                width: size.width,
                frostColor: theme.dividerColor,
                borderRadius: BorderRadius.circular(16),
                blur: 7,
              ),
            ),
            const SizedBox(height: 32),
          ],
        )
      ],
    );
  }
}
