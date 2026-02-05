import 'package:flutter/material.dart';
import 'package:mood_diary/presentation/view/calendar_screen.dart';
import 'package:mood_diary/presentation/view/mood_content.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/presentation/view/statistics_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _contents = const [MoodContent(), StatisticsContent()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackgroundColor,
        elevation: 0,
        title: Text(
          _formatDateTime(DateTime.now()),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimaryColor,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: _pickDateTime,
              icon: const Icon(
                Icons.calendar_month,
                color: AppColors.textPrimaryColor,
              ),
            ),
          ),
        ],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(72),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 20, 12),
            child: Container(
              height: 30,
              width: 340,
              decoration: BoxDecoration(
                color: AppColors.secondaryButtonColor,
                borderRadius: BorderRadius.circular(47),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: _buildTab(
                      0,
                      'Дневник настроения',
                      Icons.book_outlined,
                      Icons.book,
                    ),
                  ),
                  Expanded(
                    child: _buildTab(
                      1,
                      'Статистика',
                      Icons.bar_chart_outlined,
                      Icons.bar_chart,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: IndexedStack(index: _selectedIndex, children: _contents),
    );
  }

  Widget _buildTab(
    int index,
    String label,
    IconData icon,
    IconData activeIcon,
  ) {
    final isActive = _selectedIndex == index;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() => _selectedIndex = index);
      },
      child: AnimatedContainer(
        duration: const Duration(microseconds: 100),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryButtonColor : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),

        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isActive ? activeIcon : icon,
                size: 12,
                color: isActive
                    ? AppColors.textButtonColor
                    : AppColors.textPrimaryColor,
              ),

              const SizedBox(width: 6),

              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isActive
                      ? AppColors.textButtonColor
                      : AppColors.textPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDateTime(DateTime date) {
    final months = [
      'января',
      'ферваля',
      'марта',
      'апреля',
      'мая',
      'июня',
      'июля',
      'августа',
      'сентября',
      'октября',
      'ноября',
      'декабря',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _pickDateTime() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CalendarScreen()),
    );
  }
}
