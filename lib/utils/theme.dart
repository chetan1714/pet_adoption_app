import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(color: Colors.blueAccent),
    textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.black)),
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(color: Colors.grey[850]),
    textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
  );
}
