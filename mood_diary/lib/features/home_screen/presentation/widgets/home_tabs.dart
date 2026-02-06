import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';

class HomeTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const HomeTabs({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SizedBox(
        height: 30,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _TabButton(
              index: 0,
              selectedIndex: selectedIndex,
              label: 'Дневник настроения',
              icon: Icons.book_outlined,
              activeIcon: Icons.book,
              onTap: onChanged,
            ),
            const SizedBox(width: 8),
            _TabButton(
              index: 1,
              selectedIndex: selectedIndex,
              label: 'Статистика',
              icon: Icons.bar_chart_outlined,
              activeIcon: Icons.bar_chart,
              onTap: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final String label;
  final IconData icon;
  final IconData activeIcon;
  final ValueChanged<int> onTap;

  const _TabButton({
    required this.index,
    required this.selectedIndex,
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = index == selectedIndex;

    final Color textColor = isActive
        ? AppColors.surfaceColor
        : AppColors.textSecondaryColor;

    final Color backgroundColor = isActive
        ? AppColors.accentColor
        : Colors.transparent;

    final IconData displayedIcon = isActive ? activeIcon : icon;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(displayedIcon, size: 12, color: textColor),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
