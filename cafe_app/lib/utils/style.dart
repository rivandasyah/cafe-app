import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextTheme textTheme = TextTheme(
  headline1: GoogleFonts.poppins(
      fontSize: 94, fontWeight: FontWeight.w300, letterSpacing: -1.6),
  headline2: GoogleFonts.poppins(
      fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.poppins(
      fontSize: 46, fontWeight: FontWeight.w200, letterSpacing: -0.2),
  headline4: GoogleFonts.poppins(
      fontSize: 34, fontWeight: FontWeight.w500, letterSpacing: 0.25),
  headline5: GoogleFonts.poppins(
      fontSize: 22, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  headline6: GoogleFonts.poppins(
      fontSize: 10, fontWeight: FontWeight.w200, letterSpacing: 0.15),
  subtitle1: GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w300, letterSpacing: 0.15),
  subtitle2: GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w300, letterSpacing: 0.1),
  bodyText1: GoogleFonts.poppins(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w300, letterSpacing: 1.5),
);

final Color primaryColor = Colors.blueGrey[800];
final Color secondaryColor = Colors.blueGrey[600];
final Brightness brightness = Brightness.dark;