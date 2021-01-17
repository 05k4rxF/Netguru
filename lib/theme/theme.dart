import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  //Light theme
  static final ThemeData light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Color(0xFFEEEFF4),
    primaryColor: Color(0xFF00D664),
    accentColor: Color(0xFF1BB598),
    iconTheme: IconThemeData(
      color: Color(0xFFADB0BC),
    ),
    cardTheme: CardTheme(
      color: Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    ),
    textTheme: GoogleFonts.nunitoSansTextTheme().apply(
      displayColor: Color(0xFF243455),
      bodyColor: Color(0xFF243455),
    ),
    hintColor: Color(0xFFADB0BC),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
    ),
  );

  //Dark theme
  static final ThemeData dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Color(0xFF171A1F),
    primaryColor: Color(0xFF00D664),
    accentColor: Color(0xFF1BB598),
    iconTheme: IconThemeData(
      color: Color(0xFFADB0BC),
    ),
    cardTheme: CardTheme(
      color: Color(0xFF262A34),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    ),
    textTheme: GoogleFonts.nunitoSansTextTheme().apply(
      displayColor: Color(0xFFE7E7E7),
      bodyColor: Color(0xFFE7E7E7),
    ),
    hintColor: Color(0xFFADB0BC),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Color(0xFF262A34),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
    ),
  );
}
