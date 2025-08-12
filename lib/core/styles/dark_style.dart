import 'package:flutter/material.dart';
import '../colors/dark_colors.dart';

ThemeData buildDarkTheme() {
  final c = DarkColors();

  final scheme = ColorScheme(
    brightness: Brightness.dark,
    primary: c.primary500,
    onPrimary: Colors.white,
    primaryContainer: c.primary600,
    onPrimaryContainer: Colors.white,
    secondary: const Color(0xFF8EA0FF),
    onSecondary: Colors.white,
    secondaryContainer: c.secondary,
    onSecondaryContainer: Colors.white,
    tertiary: const Color(0xFF7DC5FF),
    onTertiary: Colors.white,
    error: c.error,
    onError: Colors.black,
    surface: const Color(0xFF0B1020),
    onSurface: const Color(0xFFEAF0FF),
    surfaceContainerHighest: c.secondary,
    outline: Colors.white,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: scheme,
    scaffoldBackgroundColor: scheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      centerTitle: true,
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: scheme.primary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: c.secondary,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: scheme.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: scheme.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: scheme.primary),
      ),
      hintStyle: TextStyle(color: scheme.onSurface.withOpacity(.6)),
      labelStyle: TextStyle(color: scheme.onSurface.withOpacity(.8)),
    ),
    iconTheme: IconThemeData(color: scheme.onSurface),
    dividerColor: scheme.outline,
  );
}
