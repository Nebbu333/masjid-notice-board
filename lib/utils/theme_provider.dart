import 'package:flutter/material.dart';

enum ThemeColorScheme {
  greenGold,
  emerald,
  blue,
  purple,
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeColorScheme _colorScheme = ThemeColorScheme.greenGold;

  ThemeMode get themeMode => _themeMode;
  ThemeColorScheme get colorScheme => _colorScheme;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setColorScheme(ThemeColorScheme scheme) {
    _colorScheme = scheme;
    notifyListeners();
  }

  // Color getters based on scheme
  Color get primaryColor {
    switch (_colorScheme) {
      case ThemeColorScheme.greenGold:
        return isDarkMode ? const Color(0xFF4A7C2A) : const Color(0xFF2D5016);
      case ThemeColorScheme.emerald:
        return isDarkMode ? const Color(0xFF10B981) : const Color(0xFF059669);
      case ThemeColorScheme.blue:
        return isDarkMode ? const Color(0xFF3B82F6) : const Color(0xFF1E40AF);
      case ThemeColorScheme.purple:
        return isDarkMode ? const Color(0xFF8B5CF6) : const Color(0xFF6D28D9);
    }
  }

  Color get secondaryColor {
    switch (_colorScheme) {
      case ThemeColorScheme.greenGold:
        return const Color(0xFFD4AF37);
      case ThemeColorScheme.emerald:
        return const Color(0xFF34D399);
      case ThemeColorScheme.blue:
        return const Color(0xFF60A5FA);
      case ThemeColorScheme.purple:
        return const Color(0xFFA78BFA);
    }
  }

  Color get backgroundColor {
    if (isDarkMode) {
      return const Color(0xFF121212);
    }
    return const Color(0xFFF5F5DC);
  }

  Color get surfaceColor {
    if (isDarkMode) {
      return const Color(0xFF1E1E1E);
    }
    return Colors.white;
  }

  Color get textColor {
    if (isDarkMode) {
      return Colors.white;
    }
    return Colors.black87;
  }

  Color get textSecondaryColor {
    if (isDarkMode) {
      return Colors.grey[400]!;
    }
    return Colors.grey[600]!;
  }
}

