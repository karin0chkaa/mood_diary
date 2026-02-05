import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Nunito',

    colorScheme: ColorScheme.light(
      primary: AppColors.primaryButtonColor,
      onPrimary: AppColors.textButtonColor,

      secondary: AppColors.secondaryButtonColor,
      onSecondary: Colors.black,

      background: AppColors.primaryBackgroundColor,
      onBackground: AppColors.textSecondaryColor,

      surface: AppColors.primaryBackgroundColor,
      onSurface: AppColors.textSecondaryColor,

      outline: const Color(0xFFE0DCD7),
      outlineVariant: const Color(0xFFD0C8C0),

      error: AppColors.placeholderColor,
      onError: Colors.white,
    ),

    scaffoldBackgroundColor: AppColors.primaryBackgroundColor,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryBackgroundColor,
      foregroundColor: AppColors.textPrimaryColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimaryColor,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryButtonColor,
        foregroundColor: AppColors.textButtonColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    ),

    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.textSecondaryColor,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.textSecondaryColor,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: AppColors.textSecondaryColor,
        letterSpacing: 0.2,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondaryColor,
      ),
      bodySmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondaryColor,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColors.placeholderColor,
      ),
    ),

    sliderTheme: SliderThemeData(
      trackHeight: 6,
      activeTrackColor: AppColors.primaryButtonColor,
      inactiveTrackColor: const Color(0xFFEDEDED),
      thumbColor: AppColors.primaryButtonColor,
      overlayColor: AppColors.primaryButtonColor.withOpacity(0.2),
      trackShape: const RoundedRectSliderTrackShape(),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF8F6F4),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.primaryButtonColor,
          width: 2,
        ),
      ),
      hintStyle: const TextStyle(
        color: AppColors.placeholderColor,
        fontSize: 14,
      ),
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.zero,
    ),
    
    iconTheme: const IconThemeData(
      color: AppColors.textSecondaryColor,
      size: 24,
    ),
  );
}
