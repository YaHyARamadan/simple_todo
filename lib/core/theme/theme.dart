import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.grey[900],
  colorScheme: ColorScheme.dark(
    background: Colors.grey[850]!,
    primary: Colors.tealAccent,
    secondary: Colors.teal,
    surface: Colors.grey[800]!,
    onBackground: Colors.white70,
    onPrimary: Colors.black,
    onSecondary: Colors.white70,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900],
    iconTheme: IconThemeData(color: Colors.tealAccent),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.tealAccent,
  ),
);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light(
    background: Color(0xFFF3F4F6),
    // Light grey background
    primary: Colors.blueGrey,
    // Subtle grey for primary elements
    secondary: Colors.blueAccent,
    // Accent color for contrast
    surface: Colors.white,
    // White for surfaces like cards
    onBackground: Colors.black87,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.blueAccent),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.blueAccent,
  ),
);
