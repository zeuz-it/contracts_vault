import 'package:flutter/material.dart';
import '/../../../features/app_navigation/ui/app_navigation.dart';
import '/../../../features/add_contract/ui/create_item_page.dart';
import '/../../../features/add_contract/ui/published_page.dart';
import '/../../../features/add_contract/ui/set_price_page.dart';
import '/../../../features/support/ui/support_page.dart';
import '/../../../features/wallet/models/wallet_type.dart';
import '/../../../features/wallet/ui/connect_wallet_page.dart';
import '/../../../features/wallet/ui/wallet_page.dart';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

/// [AppNavigator] is the navigation widget which contains the internal page
/// routes of the app
class AppNavigator extends StatelessWidget {
  static const String appNavigation = "appNavigation";
  static const String connectWalletPage = "connectWalletPage";
  static const String walletPage = "walletPage";
  static const String searchPage = "searchPage";
  static const String editProfilePage = "editProfilePage";
  static const String profilePage = "profilePage";
  static const String supportPage = "supportPage";
  static const String tncPage = "tncPage";
  static const String faqsPage = "faqsPage";
  static const String createItemPage = "createItemPage";
  static const String setPricePage = "setPricePage";
  static const String publishedPage = "publishedPage";

  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = appNavigatorKey.currentState!.canPop();
        if (canPop) {
          appNavigatorKey.currentState!.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: appNavigatorKey,
        initialRoute: appNavigation,
        onGenerateRoute: (RouteSettings settings) {
          late Widget Function(BuildContext, Animation, Animation) builder;
          switch (settings.name) {
            case appNavigation:
              builder = (_, __, ___) => const AppNavigation();
              break;
            case connectWalletPage:
              builder = (_, __, ___) => const ConnectWalletPage();
              break;
            case walletPage:
              WalletType walletType = settings.arguments as WalletType;
              builder = (_, __, ___) => WalletPage(walletType: walletType);
              break;
            case supportPage:
              builder = (_, __, ___) => const SupportPage();
              break;
            case createItemPage:
              builder = (_, __, ___) => const CreateItemPage();
              break;
            case setPricePage:
              builder = (_, __, ___) => const SetPricePage();
              break;
            case publishedPage:
              builder = (_, __, ___) => const PublishedPage();
              break;
          }
          return PageRouteBuilder(pageBuilder: builder, settings: settings);
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
