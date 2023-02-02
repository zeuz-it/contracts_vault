import '../../seller.dart';
import '/../../../generated/assets.dart';

enum NotificationType { nft, wallet }

class Notification {
  final Seller seller;
  final String time;
  final String nftImage;
  final NotificationType notificationType;

  Notification(
    this.seller,
    this.time,
    this.nftImage, [
    this.notificationType = NotificationType.nft,
  ]);

  static final List<Notification> _notifications = [
    Notification(
        Seller.sellers1[0], "21 Jan, 2022, 10:41 am", Assets.miniNfts1),
    Notification(
        Seller.sellers1[1], "21 Jan, 2022, 09:23 am", Assets.miniNfts2),
    Notification(
        Seller.sellers1[2], "20 Jan, 2022, 11:46 pm", Assets.miniNfts3),
    Notification(
      Seller.sellers2[3],
      "20 Jan, 2022, 11:46 pm",
      Assets.miniNfts3,
      NotificationType.wallet,
    ),
    Notification(
        Seller.sellers1[3], "20 Jan, 2022, 10:19 pm", Assets.miniNfts4),
    Notification(
        Seller.sellers1[4], "20 Jan, 2022, 08:07 am", Assets.miniNfts5),
    Notification(
        Seller.sellers1[5], "20 Jan, 2022, 06:34 am", Assets.miniNfts6),
    Notification(
        Seller.sellers2[0], "21 Jan, 2022, 10:41 am", Assets.miniNfts7),
    Notification(
        Seller.sellers2[1], "21 Jan, 2022, 09:23 am", Assets.miniNfts8),
    Notification(
      Seller.sellers2[4],
      "20 Jan, 2022, 11:46 pm",
      Assets.miniNfts3,
      NotificationType.wallet,
    ),
    Notification(
        Seller.sellers2[2], "20 Jan, 2022, 11:46 pm", Assets.miniNfts9),
  ];

  static List<Notification> get list => _notifications;
}
