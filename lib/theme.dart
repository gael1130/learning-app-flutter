import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

// import 'package:learningapp/assets/Montserrat-Italic-VariableFont_wght.ttf';
// import 'package:learningapp/assets/Montserrat-VariableFont_wght.ttf';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);
const Color navigationDark = Color.fromARGB(40, 40, 55, 1);
const Color backgroundDark = Color.fromARGB(12, 11, 30, 1);
const Color violet = Colors.deepPurple;
// const Color redBack = Colors.red;
// const Color greenAppBar = Colors.green;

var appTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  // fontFamily: GoogleFonts.oswald().fontFamily,
  // fontFamily: GoogleFonts.oswald().fontFamily,
  fontFamily: "Lato",
  // fontFamily: GoogleFonts.montserrat().fontFamily,
  appBarTheme: const AppBarTheme(
    // color: navigationDark,
    backgroundColor: Colors.deepPurple,
    centerTitle: true,
    titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
  ),
  scaffoldBackgroundColor: darkBlue,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      primary: violet,
      onPrimary: Colors.white70,
      // primary: Colors.deepOrange,
    ),
  ),

  // brightness: Brightness.dark,
  textTheme: const TextTheme(
    bodyText1: TextStyle(fontSize: 18),
    bodyText2: TextStyle(fontSize: 16),
    button: TextStyle(
      // fontSize: 27,
      // letterSpacing: 1.5,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      shadows: [
        Shadow(
          offset: Offset(0, 0),
          blurRadius: 3.0,
          color: Color.fromRGBO(192, 219, 255, 0.75),
        ),
        Shadow(
          offset: Offset(0, 0),
          blurRadius: 1.0,
          color: Color.fromRGBO(65, 120, 255, 0.24),
        ),
      ],
    ),
  ),
);


// shadow: https://stackoverflow.com/questions/52227846/how-can-i-add-shadow-to-the-widget-in-flutter