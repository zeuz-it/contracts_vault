import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import '/../../../features/components/curved_image.dart';
import '/../../../features/components/custom_button.dart';
import '/../../../features/components/favorite_button.dart';
import '/../../../features/custom_scaffold/ui/custom_scaffold.dart';
import '../../media.dart';
import '/../../../features/media/ui/bid_page.dart';
import '/../../../generated/assets.dart';
import '/../../../generated/l10n.dart';

import 'bid_history_list.dart';

class MediaInfoPage extends StatefulWidget {
  const MediaInfoPage({Key? key, required this.media}) : super(key: key);
  final Media media;

  @override
  State<MediaInfoPage> createState() => _MediaInfoPageState();
}

class _MediaInfoPageState extends State<MediaInfoPage> {
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    return CustomScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.media.timeLeft,
            style: theme.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          actions: [
            FavoriteButton(
              isFavorite: widget.media.isFavourite,
              onTap: () {
                setState(() {
                  widget.media.isFavourite = !widget.media.isFavourite;
                });
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              physics: const BouncingScrollPhysics(),
              children: [
                _imageWithBid(context, s, theme),
                const SizedBox(height: 40),
                Text(
                  widget.media.name,
                  style: theme.textTheme.headlineSmall!.copyWith(fontSize: 28),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.media.description,
                  maxLines: 4,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.primaryColorLight.withOpacity(0.7),
                    height: 1.2,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 12),
                _ownerTile(s, theme),
                const SizedBox(height: 20),
                const BidHistoryList(),
              ],
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              alignment: AlignmentDirectional.topStart,
              child: widget.media.isFavourite
                  ? Container(
                      decoration: BoxDecoration(
                        color: theme.primaryColorLight,
                        borderRadius: const BorderRadiusDirectional.only(
                          topStart: Radius.circular(16),
                          bottomStart: Radius.circular(16),
                          bottomEnd: Radius.circular(16),
                        ),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        leading: const Icon(Icons.favorite, color: Colors.red),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 6),
                        minLeadingWidth: 0,
                        title: Text(
                          s.liked,
                          style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.primaryColorDark,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: CustomButton(
                          text: s.saveToCollection,
                          icon: Icon(Icons.add, color: theme.primaryColor),
                          color: theme.primaryColorLight,
                          textColor: theme.primaryColor,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }

  Stack _imageWithBid(BuildContext context, S s, ThemeData theme) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CurvedImage(
          image: widget.media.image,
          height: MediaQuery.of(context).size.height * 0.44,
        ),
        Positioned(
          left: 8,
          right: 8,
          bottom: -32,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(s.highestBid),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Image.asset(Assets.iconsNft, height: 16),
                      const SizedBox(width: 8),
                      Text(
                        widget.media.highestBid.toStringAsFixed(2),
                        style: theme.textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
              CustomButton(
                text: S.of(context).placeABid,
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => BidPage(media: widget.media),
                  );
                },
              ),
            ],
          ).frosted(
            frostColor: theme.hintColor,
            padding: const EdgeInsetsDirectional.fromSTEB(24, 14, 12, 14),
            borderRadius: BorderRadius.circular(40),
            blur: 7,
          ),
        ),
      ],
    );
  }

  ListTile _ownerTile(S s, ThemeData theme) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CurvedImage(
        image: widget.media.seller.image,
        height: 40,
        radius: 30,
      ),
      title: Text(
        s.owner,
        style:
            theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.normal),
      ),
      subtitle: Text(
        widget.media.seller.name,
        style: theme.textTheme.bodyLarge,
      ),
      trailing: CustomButton(
        text: s.follow,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        color: const Color(0xff5A5B61),
        fontSize: 12,
      ),
    );
  }
}
