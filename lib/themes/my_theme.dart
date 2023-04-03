import 'package:flutter/material.dart';
import 'package:inteligence_artificial_app/themes/theme_colors.dart';

ThemeData myTheme = ThemeData(
  primarySwatch: ThemeColors.primaryColor,
  primaryColor: ThemeColors.primaryColor,
  appBarTheme: const AppBarTheme(backgroundColor: ThemeColors.primaryColor),
  inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none),
  brightness: Brightness.dark,
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontSize: 16,
    ),
    bodyLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
  ),
);
