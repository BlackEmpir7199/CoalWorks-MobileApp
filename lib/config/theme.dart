import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Base text style using Poppins
  static final TextStyle _basePoppinsStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  // Custom text theme with Poppins font
  static TextTheme _createPoppinsTextTheme(Color textColor) {
    return TextTheme(
      // Headline Styles
      displayLarge: _basePoppinsStyle.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
      displayMedium: _basePoppinsStyle.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      displaySmall: _basePoppinsStyle.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),

      // Title Styles
      titleLarge: _basePoppinsStyle.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      titleMedium: _basePoppinsStyle.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      titleSmall: _basePoppinsStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),

      // Body Styles
      bodyLarge: _basePoppinsStyle.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      bodyMedium: _basePoppinsStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      bodySmall: _basePoppinsStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: textColor,
      ),

      // Label Styles
      labelLarge: _basePoppinsStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      labelMedium: _basePoppinsStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      labelSmall: _basePoppinsStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        color: textColor,
      ),
    );
  }

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,

    // Apply Poppins text theme
    textTheme: _createPoppinsTextTheme(Colors.black),
    primaryTextTheme: _createPoppinsTextTheme(Colors.black),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
    ),

    colorScheme: ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.grey.shade700,
      background: Colors.white,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Colors.black,
      onSurface: Colors.black,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      elevation: 8,
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.black, width: 2),
      ),
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,

    // Apply Poppins text theme
    textTheme: _createPoppinsTextTheme(Colors.white),
    primaryTextTheme: _createPoppinsTextTheme(Colors.white),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),

    colorScheme: ColorScheme.dark(
      primary: Colors.white,
      secondary: Colors.grey.shade600,
      background: Colors.black,
      surface: Colors.grey.shade900,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onBackground: Colors.white,
      onSurface: Colors.white,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.black,
      elevation: 8,
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.white, width: 2),
      ),
    ),
  );
}
