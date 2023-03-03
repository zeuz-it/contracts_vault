import 'package:blur/blur.dart';
import 'package:contracts_vault/features/add_contract/ui/add_contract_page.dart';
import 'package:flutter/material.dart';
import '/../../../features/custom_scaffold/ui/custom_scaffold.dart';
import '/../../../features/settings/ui/explore_page.dart';
import '/../../../features/contracts/ui/notifications_page.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({Key? key}) : super(key: key);

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    const NotificationsPage(),
    Container(),
    const ExplorePage(),
  ];

  void _onItemTapped(int index) {
    if (index != 1) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold.withBg2(
      child: Scaffold(
        extendBody: true,
        body: _children[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.description,
                size: 36,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle, size: 0),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 36,
              ),
              label: "",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ).frosted(
          frostColor: Theme.of(context).hintColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          padding: const EdgeInsets.only(top: 0),
          blur: 4,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddContractPage())),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
