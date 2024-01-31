import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  appBarTheme:
      const AppBarTheme(backgroundColor: Color.fromARGB(255, 253, 176, 24)),
  scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
  dividerColor: Colors.white24,
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  textTheme: TextTheme(
      titleMedium: const TextStyle(
          color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w500),
      bodyMedium: const TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      )),
  iconTheme: const IconThemeData(color: Color.fromARGB(0, 255, 255, 255)),
  useMaterial3: true,
);
