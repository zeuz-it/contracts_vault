import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import '/../../../core/custom_direction.dart';
import '/../../../features/components/curved_image.dart';
import '/../../../features/components/custom_button.dart';
import '../../seller.dart';
import '/../../../generated/l10n.dart';

class SellerCard extends StatelessWidget {
  const SellerCard({
    Key? key,
    required this.seller,
    this.direction = CustomDirection.horizontal,
  }) : super(key: key);

  factory SellerCard.vertical({required Seller seller}) => SellerCard(
        seller: seller,
        direction: CustomDirection.vertical,
      );

  final Seller seller;
  final CustomDirection direction;

  @override
  Widget build(BuildContext context) {
    switch (direction) {
      case CustomDirection.horizontal:
        return SellerCardHorizontal(seller: seller);
      case CustomDirection.vertical:
        return SellerCardVertical(seller: seller);
    }
  }
}

class SellerCardHorizontal extends StatelessWidget {
  const SellerCardHorizontal({Key? key, required this.seller})
      : super(key: key);

  final Seller seller;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: theme.primaryColorLight.withOpacity(0.1),
        ),
        margin: const EdgeInsetsDirectional.only(end: 8),
        padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 16, 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CurvedImage(image: seller.image, radius: 30),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  seller.name,
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: 4),
                Text(
                  "${seller.coinQuantity} ${seller.coinName}",
                  style: theme.textTheme.labelSmall!
                      .copyWith(color: theme.disabledColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SellerCardVertical extends StatelessWidget {
  const SellerCardVertical({Key? key, required this.seller}) : super(key: key);
  final Seller seller;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
          child: Column(
            children: [
              Row(
                children: [
                  CurvedImage(image: seller.image, height: 40, radius: 30),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        seller.name,
                        style: theme.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${seller.coinQuantity} ${seller.coinName}",
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: theme.disabledColor),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                    text: s.follow,
                    fontSize: 12,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                ],
              )
            ],
          ).frosted(
            frostColor: theme.hintColor,
            borderRadius: BorderRadius.circular(24),
            padding: const EdgeInsets.fromLTRB(4, 4, 4, 140),
            blur: 7,
          ),
        ),
        PositionedDirectional(
          start: 24,
          end: 0,
          bottom: 16,
          child: SizedBox(
            height: 120,
            child: ListView.builder(
              padding: const EdgeInsetsDirectional.only(end: 16),
              itemCount: seller.nfts.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(end: 8.0),
                child: CurvedImage(image: seller.nfts[index], radius: 22),
              ),
            ),
          ),
        )
      ],
    );
  }
}
