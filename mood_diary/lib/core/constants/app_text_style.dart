import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';

abstract class AppTextStyles {
  static final TextStyle dateHeader = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textSecondaryColor,
  );

  static final TextStyle sectionTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimaryColor,
  );

  static final TextStyle emotionOption = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryColor,
  );

  static final TextStyle placeholder = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.placeholderColor,
  );

  static final TextStyle calendarTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimaryColor,
  );

  static TextStyle get calendarDay => calendarTextStyle;

  static final TextStyle calendarOutsideDay = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryColor.withOpacity(0.45),
  );

  static TextStyle get calendarToday => calendarTextStyle.copyWith(
    fontWeight: FontWeight.w600,
    color: AppColors.accentColor,
  );

  static TextStyle get calendarSelected => calendarTextStyle.copyWith(
    fontWeight: FontWeight.w700,
    color: AppColors.textOnAccentColor,
  );
}
