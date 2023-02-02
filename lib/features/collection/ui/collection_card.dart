import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import '/../../../features/collection/models/collection.dart';
import '/../../../features/components/curved_image.dart';
import '/../../../generated/l10n.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({Key? key, required this.collection}) : super(key: key);
  final Collection collection;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var s = S.of(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    collection.name,
                    style: theme.textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  Text(s.viewAll + " ${collection.nfts.length} NFTs"),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: theme.primaryColorLight,
                  ),
                ],
              )
            ],
          ).frosted(
            frostColor: theme.hintColor,
            borderRadius: BorderRadius.circular(24),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
            blur: 7,
          ),
        ),
        PositionedDirectional(
          start: 26,
          end: 0,
          bottom: 18,
          child: SizedBox(
            height: 100,
            child: ListView.builder(
              padding: const EdgeInsetsDirectional.only(end: 16),
              itemCount: collection.nfts.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(end: 8.0),
                child: CurvedImage(image: collection.nfts[index], radius: 22),
              ),
            ),
          ),
        )
      ],
    );
  }
}
