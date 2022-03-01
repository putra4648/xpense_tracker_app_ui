import 'package:flutter/material.dart';
import 'package:income_expense_tracker_app/routes/main.dart';
import 'package:income_expense_tracker_app/widgets/gradient_button.dart';

class WizardScreen extends StatefulWidget {
  const WizardScreen({Key? key}) : super(key: key);

  @override
  _WizardScreenState createState() => _WizardScreenState();
}

class _WizardScreenState extends State<WizardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/man_bg.png'),
                Image.asset('assets/man.png'),
              ],
            ),
          ),
          Text(
            'Spend Smarter\nSave More',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GradientButton(
              gradient: const LinearGradient(colors: [
                Color(0xff69AEA9),
                Color(0xff3F8782),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              text: 'Get Started',
              onPressed: () {
                Navigator.popAndPushNamed(context, AppRoutes.appRoute);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already Have Account?',
                style: TextStyle(color: Colors.black),
              ),
              TextButton(onPressed: () {}, child: const Text('Log In'))
            ],
          )
        ],
      ),
    );
  }
}
