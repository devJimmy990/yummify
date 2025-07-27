import 'package:flutter/material.dart';

class ColorManager {
  // Primary Brand Colors
  static const Color primary = Color(0xFFEF5350); // Rich Red
  static const Color primaryLight = Color(0xFFFF867C);
  static const Color primaryDark = Color(0xFFB61827);

  // Secondary Accent Colors
  static const Color secondary = Color(0xFF26A69A); // Teal
  static const Color secondaryLight = Color(0xFF64D8CB);
  static const Color secondaryDark = Color(0xFF00796B);

  // Light Theme Backgrounds & Surfaces
  static const Color scaffoldBackgroundLight = Color(0xFFF9F9F9);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color bgLight = Color(0xFFF0F3F4);

  // Dark Theme Backgrounds & Surfaces
  static const Color scaffoldBackgroundDark = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color bgDark = Color(0xFF181818);

  // Light Text
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textLocationDefault = Color(0xFF8E8E93);

  // Dark Text
  static const Color darkTextPrimary = Color(0xFFE0E0E0);
  static const Color darkTextSecondary = Color(0xFFBDBDBD);

  // Utility
  static const Color divider = Color(0xFFBDBDBD);
  static const Color darkDivider = Color(0xFF424242);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;

  // Status Colors
  static const Color success = Color(0xFF00C853);
  static const Color warning = Color(0xFFFFAB00);
  static const Color error = Color(0xFFD50000);
  static const Color info = Color(0xFF0091EA);

  // Button Color
  static const Color actionButton = Color(0xFFEF6C00); // Deep Orange

  // Sidebar
  static const Color sideBarLight = primary;

  // Light Theme Aliases
  static const Color textPrimaryLight = textPrimary;
  static const Color textSecondaryLight = textSecondary;

  // Dark Theme Aliases
  static const Color textPrimaryDarkAlt = darkTextPrimary;
  static const Color textSecondaryDarkAlt = darkTextSecondary;
}
