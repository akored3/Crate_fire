import 'package:crate_fire/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor2,
  textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
);

final darkThemeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColor2,
  scaffoldBackgroundColor: bgColorDarkTheme,
  textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
);
