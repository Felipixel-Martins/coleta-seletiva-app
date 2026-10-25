import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF2E7D32), // Verde escuro (reciclagem)
    brightness: Brightness.light,
  ),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF2E7D32),
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF2E7D32),
      foregroundColor: Colors.white,
    ),
  ),
);