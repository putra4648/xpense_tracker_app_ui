import 'package:flutter/material.dart';
import 'package:income_expense_tracker_app/app.dart';
import 'package:income_expense_tracker_app/screens/wizard_screen.dart';

class AppRoutes {
  static const wizardRoute = '/';
  static const appRoute = '/dashboard';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case wizardRoute:
        return MaterialPageRoute(builder: (_) {
          return const WizardScreen();
        });
      case appRoute:
        return MaterialPageRoute(builder: (_) {
          return const App();
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
