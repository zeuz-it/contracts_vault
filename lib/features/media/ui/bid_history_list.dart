import 'package:flutter/material.dart';
import '../../seller.dart';
import '/../../../generated/l10n.dart';

import 'bid_history_card.dart';

class BidHistoryList extends StatelessWidget {
  const BidHistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return Column(
      children: [
        Row(
          children: [
            Text(
              s.bidHistory + "  \u{1F590}",
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
        ListView.builder(
          itemCount: Seller.sellers1.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return BidHistoryCard(seller: Seller.sellers1[index]);
          },
        ),
      ],
    );
  }
}
