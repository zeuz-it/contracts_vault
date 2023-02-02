import '/../../../generated/assets.dart';

class Seller {
  final String image;
  final String name;
  final String userName;
  final double coinQuantity;
  final String coinName;
  final List<String> nfts;

  Seller(
    this.image,
    this.name,
    this.userName,
    this.coinQuantity,
    this.coinName,
    this.nfts,
  );

  static const List<String> _nfts1 = [
    Assets.miniNfts1,
    Assets.miniNfts2,
    Assets.miniNfts3,
    Assets.miniNfts4,
  ];

  static const List<String> _nfts2 = [
    Assets.miniNfts5,
    Assets.miniNfts6,
    Assets.miniNfts7,
    Assets.miniNfts8,
  ];

  static const List<String> _nfts3 = [
    Assets.miniNfts9,
    Assets.miniNfts10,
    Assets.miniNfts11,
    Assets.miniNfts12,
  ];

  static const List<String> _nfts4 = [
    Assets.miniNfts13,
    Assets.miniNfts14,
    Assets.miniNfts15,
    Assets.miniNfts16,
  ];

  static final List<Seller> _sellers1 = [
    Seller(Assets.avatars2, "George Smith", "samantha", 24.254, "ETH", _nfts1),
    Seller(Assets.avatars4, "Emili Williamson", "paul", 24.254, "ETH", _nfts2),
    Seller(Assets.avatars5, "Haydy", "genelia123", 24.254, "ETH", _nfts3),
    Seller(Assets.avatars6, "Smith", "monalisa", 24.254, "ETH", _nfts4),
    Seller(Assets.avatars7, "Rock", "rock", 24.254, "ETH", _nfts1),
    Seller(Assets.avatars3, "Paul Hayden", "rock", 24.254, "ETH", _nfts2),
  ];

  static final List<Seller> _sellers2 = [
    Seller(Assets.avatars9, "Sheena", "samantha", 24.254, "ETH", _nfts3),
    Seller(Assets.avatars10, "Moroson", "paul", 24.254, "ETH", _nfts4),
    Seller(Assets.avatars11, "Moneteon", "genelia123", 24.254, "ETH", _nfts1),
    Seller(Assets.avatars12, "Watson", "monalisa", 24.254, "ETH", _nfts2),
    Seller(Assets.avatars13, "Shady", "rock", 24.254, "ETH", _nfts3),
    Seller(Assets.avatars14, "Gelima", "samantha", 24.254, "ETH", _nfts4),
    Seller(Assets.avatars8, "Johnson", "paul", 24.254, "ETH", _nfts1),
  ];

  static List<Seller> get sellers1 => _sellers1;

  static List<Seller> get sellers2 => _sellers2;
}
