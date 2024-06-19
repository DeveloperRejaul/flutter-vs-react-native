import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/pallete.dart';

class AppTheme {
  static _border(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 2,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(7),
    );
  }

  static final dartThemeMode = ThemeData.light().copyWith(
    // input
    inputDecorationTheme: InputDecorationTheme(
      border: _border(Pallete.border),
      enabledBorder: _border(Pallete.border),
      focusedBorder: _border(Pallete.border),
    ),

    // text
    textTheme: TextTheme(
      bodyLarge: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Pallete.textBlack,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        color: Colors.grey[600],
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}
