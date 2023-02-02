import 'package:flutter/material.dart';
import '/../../../core/custom_direction.dart';
import '/../../../features/custom_scaffold/ui/custom_scaffold.dart';
import '../../media.dart';
import '../../title_row.dart';

import 'media_card.dart';

class MediaList extends StatelessWidget {
  const MediaList({
    Key? key,
    required this.image,
    required this.title,
    required this.medias,
    this.direction = CustomDirection.horizontal,
    this.showSuffix = true,
    this.showTitleRow = true,
  }) : super(key: key);

  factory MediaList.vertical({
    required String image,
    required String title,
    required List<Media> medias,
    bool showTitleRow = true,
  }) =>
      MediaList(
        image: image,
        title: title,
        medias: medias,
        direction: CustomDirection.vertical,
        showSuffix: false,
        showTitleRow: showTitleRow,
      );

  final String image;
  final String title;
  final List<Media> medias;
  final CustomDirection direction;
  final bool showSuffix;
  final bool showTitleRow;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: _child(size),
    );
  }

  Widget _child(Size size) {
    switch (direction) {
      case CustomDirection.horizontal:
        return _mediaListHorizontal(size);
      case CustomDirection.vertical:
        return _mediaListVertical(size);
    }
  }

  Widget _mediaListHorizontal(Size size) {
    return Column(
      children: [
        TitleRow(
          image: image,
          title: title,
          openContainer: _openContainer(size),
          showSuffix: showSuffix,
        ),
        SizedBox(
          height: size.height * 0.3,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: medias.length,
            itemBuilder: (context, index) {
              return MediaCard(
                media: medias[index],
                titleImage: image,
                title: title,
                direction: CustomDirection.horizontal,
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _mediaListVertical(Size size, {bool isOpened = false}) {
    return Column(
      children: [
        if (showTitleRow)
          TitleRow(
            image: image,
            title: title,
            isOpened: isOpened,
            showSuffix: showSuffix,
          ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: medias.length,
          itemBuilder: (context, index) {
            return MediaCard(
              media: medias[index],
              titleImage: image,
              title: title,
              direction: CustomDirection.vertical,
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _openContainer(Size size) {
    return CustomScaffold.withBg2(
      child: ListView(
        padding: const EdgeInsetsDirectional.only(start: 20.0, top: 40),
        physics: const BouncingScrollPhysics(),
        children: [
          _mediaListVertical(size, isOpened: true),
        ],
      ),
    );
  }
}
