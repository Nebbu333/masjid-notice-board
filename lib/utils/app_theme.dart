import 'package:flutter/material.dart';
import 'theme_provider.dart';

class AppTheme {
  static ThemeData getLightTheme(ThemeProvider provider) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: provider.primaryColor,
        primary: provider.primaryColor,
        secondary: provider.secondaryColor,
        surface: provider.surfaceColor,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: provider.backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: provider.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: provider.surfaceColor,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: provider.primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: provider.surfaceColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: provider.surfaceColor,
        selectedItemColor: provider.primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: provider.textColor),
        bodyMedium: TextStyle(color: provider.textColor),
        bodySmall: TextStyle(color: provider.textSecondaryColor),
      ),
    );
  }

  static ThemeData getDarkTheme(ThemeProvider provider) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: provider.primaryColor,
        primary: provider.primaryColor,
        secondary: provider.secondaryColor,
        surface: provider.surfaceColor,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: provider.backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: provider.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: provider.surfaceColor,
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: provider.primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: provider.surfaceColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: provider.surfaceColor,
        selectedItemColor: provider.primaryColor,
        unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: provider.textColor),
        bodyMedium: TextStyle(color: provider.textColor),
        bodySmall: TextStyle(color: provider.textSecondaryColor),
      ),
    );
  }
}
