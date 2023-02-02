import '/../../../core/constants.dart';
import 'seller.dart';
import '/../../../generated/assets.dart';

class Media {
  final String image;
  final String name;
  final String description;
  bool isFavourite;
  final Seller seller;
  final String timeLeft;
  final double highestBid;

  Media(
    this.image,
    this.name,
    this.isFavourite,
    this.seller,
    this.timeLeft,
    this.highestBid, {
    this.description = kLorem1,
  });

  static final List<Media> _medias = [
    Media(Assets.nfts1, "Spacio", false, Seller.sellers1[0], "11h: 02m: 30s",
        2.20),
    Media(Assets.nfts2, "Monsters", false, Seller.sellers1[1], "11h: 02m: 30s",
        2.20),
    Media(Assets.nfts3, "Monaro", false, Seller.sellers1[2], "11h: 02m: 30s",
        2.20),
    Media(Assets.nfts4, "Genel", false, Seller.sellers1[3], "11h: 02m: 30s",
        2.20),
    Media(Assets.nfts5, "Energy", false, Seller.sellers1[4], "11h: 02m: 30s",
        2.20),
  ];

  static List<Media> get medias => _medias;
}
