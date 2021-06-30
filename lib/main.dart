import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest/pages/home.dart';
import 'package:rest/pages/login.dart';
import 'package:rest/pages/store.dart';
import 'package:rest/pages/meal_details.dart';
import 'package:rest/firestore.dart';

void main() {
  runApp(InitFirebase());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.latoTextTheme(
            TextTheme(),
          ),
        ),
        initialRoute: "/",
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  Map arguments = settings.arguments;
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Login();
      });
    case "/store":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Store();
      });
    case "/watch-details":
      return MaterialPageRoute(builder: (BuildContext context) {
        return WatchDetails(
          meal: arguments["meal"],
          tag: arguments["tag"],
        );
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
  }
}
