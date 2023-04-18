import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  AppBarTheme currentTheme() {
    return AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ));
  }

  static Color cream = Color.fromARGB(255, 251, 246, 246);
  static Color darkBlueish = Color.fromARGB(255, 50, 58, 99);
}
