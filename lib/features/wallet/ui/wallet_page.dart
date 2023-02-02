import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import '/../../../features/custom_scaffold/ui/custom_scaffold.dart';
import '/../../../features/wallet/models/wallet_type.dart';
import '/../../../features/wallet/ui/transaction_list.dart';
import '/../../../generated/assets.dart';
import '/../../../generated/l10n.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key, required this.walletType}) : super(key: key);

  final WalletType walletType;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return CustomScaffold.withBg2(
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).wallet),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 32),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Image.asset(walletType.image, scale: 0.8),
                  ),
                  const SizedBox(height: 48),
                  Text(
                    s.recentActivities,
                    style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.primaryColorLight.withOpacity(0.7)),
                  ),
                  const Expanded(
                    child: TransactionList(),
                  ),
                ],
              ),
              PositionedDirectional(
                start: 48,
                end: 0,
                child: _walletDetailsCard(context, theme),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _walletDetailsCard(BuildContext context, ThemeData theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              color: theme.primaryColorLight.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    "xaf45a46f54a5f4afasf",
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: theme.disabledColor),
                  ),
                ),
                const SizedBox(width: 2),
                Icon(Icons.copy, size: 16, color: theme.disabledColor),
              ],
            ),
          ),
        ),
        const SizedBox(height: 40),
        Text(
          walletType.name,
          style:
              theme.textTheme.titleMedium!.copyWith(color: theme.disabledColor),
        ),
        Row(
          children: [
            Image.asset(Assets.iconsNft, scale: 2),
            const SizedBox(width: 16),
            Text("89.001 ETH", style: theme.textTheme.headlineSmall),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
              color: theme.primaryColorLight,
              iconSize: 28,
            ),
          ],
        )
      ],
    ).frosted(
      frostColor: theme.hintColor,
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(24),
    );
  }
}
