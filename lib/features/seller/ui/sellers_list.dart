import 'package:flutter/material.dart';
import '/../../../features/custom_scaffold/ui/custom_scaffold.dart';
import '../../seller.dart';
import '../../title_row.dart';
import '/../../../generated/assets.dart';
import '/../../../generated/l10n.dart';

import 'seller_card.dart';

class SellersList extends StatelessWidget {
  const SellersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: _sellerListHorizontal(context),
    );
  }

  Widget _sellerListHorizontal(BuildContext context) {
    return Column(
      children: [
        TitleRow(
          image: Assets.iconsIcSellers,
          title: S.of(context).sellers,
          openContainer: _sellerListVertical(context),
        ),
        Container(
          height: 96,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 12),
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 44,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: Seller.sellers1.length,
                      itemBuilder: (context, index) =>
                          SellerCardHorizontal(seller: Seller.sellers1[index]),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 44,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: Seller.sellers2.length,
                      itemBuilder: (context, index) =>
                          SellerCard(seller: Seller.sellers2[index]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _sellerListVertical(BuildContext context) {
    List<Seller> sellers = Seller.sellers1 + Seller.sellers2;
    return CustomScaffold.withBg2(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20.0),
            child: TitleRow(
              image: Assets.iconsIcSellers,
              title: S.of(context).sellers,
              isOpened: true,
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: sellers.length,
              itemBuilder: (context, index) {
                return SellerCard.vertical(seller: sellers[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
