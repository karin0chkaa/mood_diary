import 'dart:ui';

import 'package:mood_diary/core/constants/app_colors.dart';

abstract class AppTextStyles {
  static final TextStyle dateHeader = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryColor,
  );

  static final TextStyle sectionTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColors.textSecondaryColor,
  );

  static final TextStyle emotionOption = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondaryColor,
  );

  static final TextStyle placeholder = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.placeholderColor,
  );

  static final todayButton = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
  );

  static final weekDays = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
  );

  static final yearLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryColor,
  );

  static final monthLabel = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textSecondaryColor,
  );

  static final dayLabel = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondaryColor,
  );
}
