import 'package:flutter/material.dart';

class CElevatedButtonTheme {
  CElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFACC8F7),
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    )
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom()
  );
}
