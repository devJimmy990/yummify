// Enhanced AppTheme using updated ColorManager
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummify/core/constants/colors_manager.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorManager.scaffoldBackgroundLight,
    primaryColor: ColorManager.primary,
    colorScheme: const ColorScheme.light(
      primary: ColorManager.primary,
      primaryContainer: ColorManager.primaryLight,
      secondary: ColorManager.secondary,
      secondaryContainer: ColorManager.secondaryLight,
      onSecondary: ColorManager.white,
      onSurface: ColorManager.textPrimary,
      error: ColorManager.error,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primary,
      foregroundColor: ColorManager.white,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorManager.primary,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: ColorManager.white,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: ColorManager.textPrimary,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: ColorManager.textSecondary,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: ColorManager.grey),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorManager.actionButton,
      foregroundColor: ColorManager.white,
    ),
    dividerColor: ColorManager.divider,
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorManager.scaffoldBackgroundDark,
    primaryColor: ColorManager.primaryDark,
    colorScheme: const ColorScheme.dark(
      primary: ColorManager.primaryDark,
      primaryContainer: ColorManager.primary,
      secondary: ColorManager.secondaryDark,
      secondaryContainer: ColorManager.secondary,
      surface: ColorManager.darkSurface,
      onPrimary: ColorManager.white,
      onSecondary: ColorManager.white,
      onSurface: ColorManager.darkTextPrimary,
      error: ColorManager.error,
      onError: ColorManager.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primaryDark,
      foregroundColor: ColorManager.white,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorManager.primaryDark,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: ColorManager.white,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: ColorManager.darkTextPrimary,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: ColorManager.darkTextSecondary,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: ColorManager.darkDivider),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorManager.actionButton,
      foregroundColor: ColorManager.white,
    ),
    dividerColor: ColorManager.darkDivider,
  );
}
