import 'package:blur/blur.dart';
import 'package:contracts_vault/features/add_contract/ui/add_contract_page.dart';
import 'package:contracts_vault/features/auth/login/login_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth/bloc/auth_bloc.dart';
import '/../../../features/custom_scaffold/ui/custom_scaffold.dart';
import '../../settings/ui/settings.dart';
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
    const SettingsPage(),
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
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginUI()),
              (Route<dynamic> route) => false);
        }
      },
      buildWhen: ((previous, current) {
        if (current is AuthFailure) {
          return false;
        }
        return true;
      }),
      builder: (context, state) {
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
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              padding: const EdgeInsets.only(top: 0),
              blur: 4,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddContractPage())),
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
        );
      },
    );
  }
}
