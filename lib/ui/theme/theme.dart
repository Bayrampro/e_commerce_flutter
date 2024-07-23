import 'package:flutter/material.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepOrangeAccent,
      primary: Colors.deepOrangeAccent
  ),
  scaffoldBackgroundColor: Colors.grey[200],
  canvasColor: Colors.white,
  textTheme: const TextTheme(
    titleMedium: TextStyle(
        fontSize: 14,
        color: Colors.white,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      color: Colors.white,
    ),
  )
);