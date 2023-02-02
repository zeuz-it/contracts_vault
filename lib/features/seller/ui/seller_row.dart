import 'package:flutter/material.dart';
import '/../../../features/components/curved_image.dart';
import '../../media.dart';
import '../../seller.dart';
import '/../../../generated/assets.dart';
import '/../../../generated/l10n.dart';

class SellerRow extends StatelessWidget {
  const SellerRow({Key? key, required this.media}) : super(key: key);
  final Media media;

  Seller get seller => media.seller;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    var disabledColor = theme.primaryColorLight.withOpacity(0.8);
    return Row(
      children: [
        CurvedImage(
          image: seller.image,
          radius: 30,
          height: 44,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "@" + seller.userName,
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: disabledColor),
                  ),
                  Text(
                    s.highestBid,
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: disabledColor),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    media.timeLeft,
                    style: theme.textTheme.titleLarge,
                  ),
                  const Spacer(),
                  Image.asset(Assets.iconsNft, height: 16),
                  const SizedBox(width: 6),
                  Text(
                    media.highestBid.toStringAsFixed(2),
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
