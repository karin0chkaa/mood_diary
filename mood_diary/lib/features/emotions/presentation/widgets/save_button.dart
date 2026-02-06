import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';

class SaveButton extends StatelessWidget {
  final bool isEnable;
  final VoidCallback onPressed;

  const SaveButton({
    super.key,
    required this.isEnable,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnable ? onPressed : null,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size(335, 44),
        padding: EdgeInsets.zero,
        backgroundColor: isEnable
          ? AppColors.accentColor
          : AppColors.surfaceColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(69)),
      ),
      child: Text(
        'Сохранить',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: isEnable
              ? AppColors.textOnAccentColor
              : AppColors.textSecondaryColor,
        ),
      ),
    );
  }
}
