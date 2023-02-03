import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blur/blur.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/../../../features/components/curved_image.dart';
import '../../media.dart';
import '/../../../features/seller/ui/seller_row.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadedSlideAnimation(
      beginOffset: const Offset(0.56, 0.16),
      endOffset: Offset.zero,
      child: PageView.builder(
        controller: _controller,
        itemCount: Media.medias.length,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => ExploreCard(
          media: Media.medias[index],
          onPageChange: () {
            if (index < Media.medias.length - 1) {
              _controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            }
          },
        ),
      ),
    );
  }
}

class ExploreCard extends StatelessWidget {
  const ExploreCard({Key? key, required this.media, this.onPageChange})
      : super(key: key);
  final Media media;
  final VoidCallback? onPageChange;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            children: [
              const SizedBox(width: 16),
              Text(
                media.name,
                style: theme.textTheme.headlineSmall,
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                    media.isFavourite ? Icons.favorite : Icons.favorite_border),
                color: theme.primaryColorLight,
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.close),
                color: theme.disabledColor,
                // onPressed: onPageChange,
                onPressed: () => FirebaseAuth.instance.signOut(),
              ),
              const SizedBox(width: 4),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              media.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.normal,
                color: theme.primaryColorLight.withOpacity(0.8),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Stack(
              children: [
                CurvedImage(
                  image: media.image,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 120,
                  child: SellerRow(media: media).frosted(
                    padding: const EdgeInsets.all(20),
                    frostColor: theme.dividerColor,
                    borderRadius: BorderRadius.circular(20),
                    blur: 7,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
