import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';

class EmotionTag extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const EmotionTag({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double width = (text.length * 8.0 + 16).clamp(42.0, 120.0);
    final double height = 21;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryButtonColor : Colors.white,
          borderRadius: BorderRadius.circular(3),
          border: isSelected
              ? Border.all(color: AppColors.primaryButtonColor)
              : Border.all(color: Colors.transparent),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: isSelected ? Colors.white : AppColors.textPrimaryColor,
          ),
        ),
      ),
    );
  }
}
