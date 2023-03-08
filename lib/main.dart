import 'package:flutter/material.dart';
import 'package:learningdart/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    // HomePage h = new HomePage();

    return MaterialApp(
      home: HomePage(),
    );
  }
}
