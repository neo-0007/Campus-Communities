import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/customthemes/elevated_button_theme.dart';
import 'package:flutter_app/core/theme/customthemes/text_theme.dart';

class CAppTheme {
  CAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: const Color(0xFF558CE9),
    fontFamily: 'Popins',
    scaffoldBackgroundColor: const Color(0xFFf5f5f5),
    textTheme: CTextTheme.lightTextTheme,
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
  );
  
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF558CE9),
    fontFamily: 'Popins',
    scaffoldBackgroundColor: const Color(0xFF121212),
    textTheme: CTextTheme.darkTextTheme,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
  );
}
