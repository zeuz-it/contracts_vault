import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import '/../../../features/components/custom_button.dart';
import '../../media.dart';
import '../../seller.dart';
import '/../../../features/media/ui/bid_history_card.dart';
import '/../../../generated/l10n.dart';
import '/../../../routes/app_navigator.dart';

class BidPage extends StatelessWidget {
  const BidPage({Key? key, required this.media}) : super(key: key);

  final Media media;

  Seller get seller => media.seller;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 20.0);
    var bodyMedium = theme.textTheme.bodyMedium!
        .copyWith(color: theme.primaryColorLight.withOpacity(0.7));
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.background.withOpacity(0.4),
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s.lastHighestBid + "  \u{1F590}",
                  style: theme.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                BidHistoryCard(seller: seller),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.background,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                Padding(
                  padding: padding,
                  child:
                      Text(s.placeABid, style: theme.textTheme.headlineSmall),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: padding,
                  child: RichText(
                    text: TextSpan(
                      style: bodyMedium,
                      children: [
                        TextSpan(text: S.of(context).youAreAboutToPlaceABidFor),
                        TextSpan(
                          text: ' "${media.name}" ',
                          style: theme.textTheme.bodyLarge,
                        ),
                        TextSpan(text: s.by + " "),
                        TextSpan(
                          text: seller.name,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(),
                ListTile(
                  contentPadding:
                      const EdgeInsetsDirectional.only(start: 20, top: 8),
                  title: Text(
                    s.enterBidAmount,
                    style: theme.textTheme.titleLarge,
                  ),
                  trailing: CustomButton(
                    color: theme.primaryColorDark,
                    borderRadius: const BorderRadiusDirectional.horizontal(
                      start: Radius.circular(30),
                    ),
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(44, 20, 20, 20),
                    text: "0 ETH",
                    fontSize: 14,
                  ),
                ),
                ListTile(
                  contentPadding: padding,
                  title: Text(s.serviceFee, style: bodyMedium),
                  trailing: const Text("0.01 ETH"),
                  dense: true,
                ),
                ListTile(
                  contentPadding: padding,
                  title: Text(s.totalBidAmount, style: bodyMedium),
                  trailing: const Text("0.01 ETH"),
                  dense: true,
                ),
                const Divider(),
                ListTile(
                  contentPadding: padding,
                  title: Text(s.yourBalance, style: bodyMedium),
                  trailing: const Text("5.80 ETH"),
                  dense: true,
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: padding,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: s.cancel,
                          color: const Color(0xff2B2E3D),
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomButton(
                          text: s.placeABid,
                          onTap: () {
                            Navigator.pop(context);
                            appNavigatorKey.currentState!.pushReplacementNamed(
                                AppNavigator.connectWalletPage);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          )
        ],
      ),
    ).frosted(
      frostColor: theme.hintColor,
      blur: 7,
    );
  }
}
