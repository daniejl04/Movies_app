import 'package:flutter/material.dart';


const customPrimaryColorLight = Color(0xFF4f86b3);
const customSecondaryColorLight = Color(0xFF242f3d);
const customBackgroundColorLight = Color(0xFFF5F5F5);
const customSurfaceColorLight = Color(0xFFFFFFFF);
const customErrorColorLight = Color(0xFFB00020);

const customPrimaryColorDark = Color(0xFF0D47A1);
const customSecondaryColorDark = Color(0xFF1B5E20);
const customBackgroundColorDark = Color(0xFF121212);
const customSurfaceColorDark = Color(0xFF1E1E1E);
const customErrorColorDark = Color(0xFFCF6679);

class AppTheme {
  final bool isDarkmode;

  AppTheme({required this.isDarkmode});

  ThemeData getTheme() {
    final colorScheme = isDarkmode
        ? const ColorScheme.dark(
            primary: customPrimaryColorDark,
            secondary: Color.fromARGB(255, 6, 23, 26),
            background: customBackgroundColorDark,
            surface: customSurfaceColorDark,
            error: customErrorColorDark,
          )
        : const ColorScheme.light(
            primary: customPrimaryColorLight,
            secondary: customSecondaryColorLight,
            background: customBackgroundColorLight,
            surface: customSurfaceColorLight,
            error: customErrorColorLight,
          );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
        titleTextStyle: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: colorScheme.primary,
        textColor: colorScheme.onSurface,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.onSecondary,
      ),
    );
  }
}
