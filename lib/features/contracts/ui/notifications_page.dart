import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart' hide Notification;
import '/../../../features/components/curved_image.dart';
import '/../../../features/components/custom_button.dart';
import '/../../../features/contracts/models/notification.dart';
import '/../../../features/wallet/models/wallet_type.dart';
import '/../../../generated/l10n.dart';
import '/../../../routes/app_navigator.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return FadedSlideAnimation(
      beginOffset: const Offset(-0.56, 0.16),
      endOffset: Offset.zero,
      child: Scaffold(
        appBar: AppBar(
          title: Text(s.notifications),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                itemCount: Notification.list.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var notification = Notification.list[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: _getTile(context, notification).frosted(
                      frostColor: theme.hintColor,
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _getTile(BuildContext context, Notification notification) {
    switch (notification.notificationType) {
      case NotificationType.nft:
        return _nftListTile(context, notification);
      case NotificationType.wallet:
        return _walletListTile(context, notification);
    }
  }

  ListTile _nftListTile(BuildContext context, Notification notification) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: CurvedImage(
            image: notification.seller.image, height: 44, radius: 30),
      ),
      title: Text(
        notification.seller.name,
        style: theme.textTheme.bodyLarge,
      ),
      subtitle: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: s.bidWith,
              style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.primaryColorLight.withOpacity(0.7), height: 1.5),
            ),
            TextSpan(
              text:
                  " ${notification.seller.coinQuantity} ${notification.seller.coinName}",
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: const Color(0xff5CAB31)),
            ),
            TextSpan(
              text: "\n" + notification.time,
              style: theme.textTheme.bodySmall!.copyWith(
                  color: theme.disabledColor,
                  fontWeight: FontWeight.normal,
                  height: 1.5),
            ),
          ],
        ),
      ),
      trailing: CurvedImage(image: notification.nftImage, radius: 20),
    );
  }

  ListTile _walletListTile(BuildContext context, Notification notification) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: CircleAvatar(
          backgroundColor: theme.primaryColor,
          foregroundColor: theme.primaryColorLight,
          child: const Icon(Icons.account_balance_wallet),
          radius: 22,
        ),
      ),
      title: Text(
        s.ethReceived,
        style: theme.textTheme.bodyLarge,
      ),
      subtitle: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text:
                  "${notification.seller.coinQuantity} ${notification.seller.coinName} ",
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: const Color(0xff5CAB31)),
            ),
            TextSpan(
              text: s.added,
              style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.primaryColorLight.withOpacity(0.7), height: 1.5),
            ),
            TextSpan(
              text: "\n" + notification.time,
              style: theme.textTheme.bodySmall!.copyWith(
                  color: theme.disabledColor,
                  fontWeight: FontWeight.normal,
                  height: 1.5),
            ),
          ],
        ),
      ),
      trailing: CustomButton(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        text: s.myBalance,
        color: Colors.transparent,
        borderColor: theme.primaryColorLight,
        fontSize: 12,
        onTap: () => Navigator.pushNamed(
          context,
          AppNavigator.walletPage,
          arguments: WalletType.list[1],
        ),
      ),
    );
  }
}
