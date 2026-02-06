import 'package:flutter/material.dart';
import 'package:mood_diary/features/shell/presentation/widgets/date_title.dart';
import 'package:mood_diary/features/shell/presentation/widgets/home_tabs.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onCalendarTap;
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const HomeAppBar({
    super.key,
    required this.onCalendarTap,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: DateTitle(date: DateTime.now()),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: onCalendarTap,
          icon: const Icon(Icons.calendar_month),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: HomeTabs(selectedIndex: selectedIndex, onChanged: onTabChanged),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 64);
}
