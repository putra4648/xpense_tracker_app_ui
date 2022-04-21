import 'package:flutter/material.dart';
import 'package:income_expense_tracker_app/screens/account_screen.dart';
import 'package:income_expense_tracker_app/screens/home_screen.dart';
import 'package:income_expense_tracker_app/screens/statisctic_screen.dart';
import 'package:income_expense_tracker_app/screens/wallet_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _screens = <Widget>[
    const HomeScreen(),
    const StatisticScreen(),
    const WalletScreen(),
    const AccountScreen()
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.signal_cellular_alt_outlined),
            label: 'Statistic',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          )
        ],
      ),
      body: _screens.elementAt(index),
    );
  }
}
