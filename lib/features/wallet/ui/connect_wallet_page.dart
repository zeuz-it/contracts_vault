import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import '/../../../features/custom_scaffold/ui/custom_scaffold.dart';
import '/../../../features/wallet/models/wallet_type.dart';
import '/../../../generated/assets.dart';
import '/../../../generated/l10n.dart';

class ConnectWalletPage extends StatelessWidget {
  const ConnectWalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return CustomScaffold.withBg2(
      child: Scaffold(
        appBar: AppBar(
          title: Text(s.connectWallet),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(Assets.walletImgWallet, scale: 3),
              Text(
                s.chooseYourWallet,
                style: theme.textTheme.titleMedium!
                    .copyWith(color: theme.primaryColorLight.withOpacity(0.7)),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: WalletType.list.length,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return buildListTile(theme, WalletType.list[index]);
                  },
                ),
              ),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.6),
                  child: Text(
                    s.byVonnectingYourWallet,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.disabledColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile(ThemeData theme, WalletType walletType) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(walletType.image, scale: 2.4),
        title: Text(
          walletType.name,
          style: theme.textTheme.headlineSmall,
        ),
      ).frosted(
        frostColor: theme.hintColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        borderRadius: BorderRadius.circular(18),
      ),
    );
  }
}
