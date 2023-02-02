import 'package:flutter/material.dart';
import '/../../../features/components/curved_image.dart';
import '../../seller.dart';
import '/../../../generated/l10n.dart';

class BidHistoryCard extends StatelessWidget {
  const BidHistoryCard({Key? key, required this.seller}) : super(key: key);
  final Seller seller;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CurvedImage(
        image: seller.image,
        height: 40,
        radius: 30,
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: seller.name,
              style: theme.textTheme.bodyLarge,
            ),
            TextSpan(
              text: " " + s.bidWith,
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: theme.disabledColor),
            ),
            TextSpan(
              text: " ${seller.coinQuantity} ${seller.coinName}",
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: const Color(0xff68BF30)),
            ),
          ],
        ),
      ),
      subtitle: Text(
        "20 Jan, 2022, 10:41 am",
        style: theme.textTheme.bodySmall!.copyWith(color: theme.hintColor),
      ),
    );
  }
}
