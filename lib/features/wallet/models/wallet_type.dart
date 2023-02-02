import '/../../../generated/assets.dart';

class WalletType {
  final String image;
  final String name;

  WalletType(this.image, this.name);

  static final List<WalletType> _wallets = [
    WalletType(Assets.wallet1, "Rainbow"),
    WalletType(Assets.wallet3, "Coinbase"),
    WalletType(Assets.wallet2, "Metamask"),
  ];

  static List<WalletType> get list => _wallets;
}
