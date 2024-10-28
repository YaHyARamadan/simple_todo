import 'package:flutter/material.dart';

ThemeData darkMode =ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background:Colors.grey[900],
    primary: Colors.white38,
    secondary: Colors.white
  )
);

ThemeData lightMode =ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background:Colors.white,
      primary: Colors.grey,
      secondary: Colors.black

    )
);