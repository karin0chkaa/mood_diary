import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';

class CalendarHeader extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onClose;
  final VoidCallback onToday;

  const CalendarHeader({
    super.key,
    required this.onToday,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      leading: IconButton(
        onPressed: onClose,
        icon: const Icon(Icons.close, color: AppColors.textSecondaryColor),
      ),
      actions: [
        TextButton(
          onPressed: onToday,
          child: const Text(
            'Сегодня',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondaryColor,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
