import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/customthemes/elevated_button_theme.dart';
import 'package:flutter_app/core/theme/customthemes/text_theme.dart';
import 'package:flutter_app/core/utils/colors.dart';

class CAppTheme {
  CAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: CColors.primaryColor,
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: CColors.scaffoldBackgroundColor,
    textTheme: CTextTheme.lightTextTheme,
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
  );
  
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: CColors.primaryColor,
    fontFamily: 'Popins',
    scaffoldBackgroundColor: CColors.darkScaffoldBackgroundColor,
    textTheme: CTextTheme.darkTextTheme,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
  );
}
