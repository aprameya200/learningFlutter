import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:learningdart/pages/home_page.dart';
import 'package:learningdart/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

Color? selectedColor;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int days = 30;

    HomePage homePage = new HomePage();

    return MaterialApp(
      //home: homePage.build(context), set below from route
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato()
              .fontFamily), //setting primary forn from google fonts
      initialRoute: "/", //opens initial route instead of specified routes below
      routes: {
        //routes like laravel
        "/": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
