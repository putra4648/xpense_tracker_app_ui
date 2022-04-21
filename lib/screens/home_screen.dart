import 'package:flutter/material.dart';
import 'package:income_expense_tracker_app/widgets/account_info.dart';
import 'package:income_expense_tracker_app/widgets/header.dart';
import 'package:income_expense_tracker_app/widgets/send_people.dart';
import 'package:income_expense_tracker_app/widgets/transaction_history.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            Header(
              child: Positioned.fill(
                bottom: -100,
                child: AccountInformation(),
              ),
            ),
            TransactionHistory(),
            SendPeople(),
          ],
        ),
      ),
    );
  }
}
