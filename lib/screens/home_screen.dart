import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          children: [
            const Header(),
            Theme(
              data: Theme.of(context).copyWith(
                textTheme: GoogleFonts.interTextTheme().apply(
                  displayColor: Colors.black,
                  bodyColor: Colors.black,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: const Color.fromRGBO(102, 102, 102, 1),
                  ),
                ),
              ),
              child: const TransactionHistory(),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                textTheme: GoogleFonts.interTextTheme().apply(
                  displayColor: Colors.black,
                  bodyColor: Colors.black,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: const Color.fromRGBO(102, 102, 102, 1),
                  ),
                ),
              ),
              child: const SendPeople(),
            ),
          ],
        ),
      ),
    );
  }
}
