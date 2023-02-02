import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff816ECF);
  static const Color scaffoldBackgroundColor = Colors.transparent;
  static const Color primaryColorLight = Colors.white;
  static const Color primaryColorDark = Colors.black;
  static const Color cardColor = Color(0xff13171F);
  static const Color hintColor = Color(0xff3E4047);
  static const Color backgroundColor = Color(0xff13141D);
  static Color disabledColor = Colors.white.withOpacity(0.5);

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    primaryColor: primaryColor,
    primaryColorLight: primaryColorLight,
    primaryColorDark: primaryColorDark,
    backgroundColor: backgroundColor,
    cardColor: cardColor,
    hintColor: hintColor,
    disabledColor: disabledColor,
    dividerColor: hintColor,
    colorScheme: const ColorScheme.light(
      secondary: primaryColor,
      onSecondary: primaryColorLight,
      primary: Color(0xffB3BCD9),
    ),
    fontFamily: "ProductSans",

    /// appbar theme
    appBarTheme: const AppBarTheme(
      color: scaffoldBackgroundColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: "ProductSans",
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),

    /// bottom bar navigation bar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColorLight,
      unselectedItemColor: primaryColorLight.withOpacity(0.8),
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),

    /// text theme
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: primaryColorLight, fontWeight: FontWeight.bold),
      labelSmall: TextStyle(letterSpacing: 0.2),
      bodyLarge: TextStyle(),
      bodyMedium: TextStyle(),
      titleMedium: TextStyle(),
      headlineMedium: TextStyle(color: primaryColorLight),
      headlineSmall: TextStyle(),
      titleLarge: TextStyle(),
      labelLarge: TextStyle(fontSize: 16, letterSpacing: 1.2),
    ).apply(bodyColor: primaryColorLight),
  );
}
