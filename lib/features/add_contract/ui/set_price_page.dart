import 'package:flutter/material.dart';
import '../../../features/components/custom_button.dart';
import '../../../features/components/entry_field.dart';
import '../../../features/custom_scaffold/ui/custom_scaffold.dart';
import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../routes/app_navigator.dart';

class SetPricePage extends StatelessWidget {
  const SetPricePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return CustomScaffold.withBg2(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(s.setPrice),
          ),
          body: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.background,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.hintColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: TabBar(
                      physics: const BouncingScrollPhysics(),
                      isScrollable: true,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 48),
                      indicator: BoxDecoration(
                        color: theme.primaryColorLight.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelStyle: theme.textTheme.titleMedium,
                      unselectedLabelColor: theme.primaryColorLight,
                      tabs: [
                        Tab(text: s.fixedPrice),
                        Tab(text: s.auction),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const PriceSection(),
                      Column(
                        children: const [
                          PriceSection(),
                          DateSection(),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  text: s.publish,
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppNavigator.publishedPage,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PriceSection extends StatelessWidget {
  const PriceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return Column(
      children: [
        EntryField(
          label: s.enterPrice,
          suffix: Container(
            margin: const EdgeInsetsDirectional.only(start: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.primaryColorDark,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(Assets.iconsNft, scale: 3),
                const SizedBox(width: 10),
                const Text("ETH"),
                const SizedBox(width: 10),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: theme.primaryColorLight,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 28),
        Row(
          children: [
            Text(
              s.youWillReceive,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: theme.primaryColorLight.withOpacity(0.7)),
            ),
            const Spacer(),
            Text(
              "0.99 ETH",
              style: theme.textTheme.titleSmall!.copyWith(color: Colors.green),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Text(
              s.serviceFee + "1%",
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: theme.primaryColorLight.withOpacity(0.7)),
            ),
            const Spacer(),
            Text(
              "0.01 ETH",
              style: theme.textTheme.titleSmall!
                  .copyWith(color: theme.primaryColorLight),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Divider(),
      ],
    );
  }
}

class DateSection extends StatelessWidget {
  const DateSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return Column(
      children: [
        EntryField(
          label: s.startingDate,
          suffixIcon: Icon(
            Icons.keyboard_arrow_down,
            color: theme.primaryColorLight,
          ),
          readOnly: true,
          initialValue: s.today,
        ),
        EntryField(
          label: s.expirationDate,
          suffixIcon: Icon(
            Icons.keyboard_arrow_down,
            color: theme.primaryColorLight,
          ),
          initialValue: s.tenDays,
          readOnly: true,
        ),
      ],
    );
  }
}
