import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_tracker_app/routes/main.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color.fromRGBO(66, 136, 131, 1),
            secondary: Colors.white,
          ),
          textTheme: GoogleFonts.interTextTheme().apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
          buttonTheme: ButtonThemeData(
            colorScheme: Theme.of(context).colorScheme,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          iconTheme: IconTheme.of(context).copyWith(color: Colors.white),
        ),
        darkTheme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.interTextTheme(),
        ),
        title: 'Trackering Yours',
        initialRoute: AppRoutes.wizardRoute,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
