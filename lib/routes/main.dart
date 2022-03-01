import 'package:flutter/material.dart';
import 'package:income_expense_tracker_app/screens/home_screen.dart';
import 'package:income_expense_tracker_app/screens/wizard_screen.dart';

class AppRoutes {
  static const wizardRoute = '/';
  static const homeRoute = '/home';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case wizardRoute:
        return MaterialPageRoute(builder: (_) {
          return const WizardScreen();
        });
      case homeRoute:
        return MaterialPageRoute(builder: (_) {
          return const HomeScreen();
        });
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Text('Error'),
          );
        });
    }
  }
}
