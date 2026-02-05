import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';

class EmotionCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const EmotionCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: 118,
        height: 83,
        decoration: BoxDecoration(
          color: AppColors.textButtonColor,
          borderRadius: BorderRadius.circular(74),
          border: isSelected
              ? Border.all(color: AppColors.primaryButtonColor, width: 3)
              : Border.all(color: Colors.transparent, width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: isSelected
                    ? AppColors.primaryButtonColor
                    : AppColors.textSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
