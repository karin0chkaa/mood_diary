import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/core/constants/app_text_style.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthCalendarItem extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final Set<DateTime> datesWithMood;
  final Function(DateTime) onDaySelected;

  const MonthCalendarItem({
    super.key,
    required this.focusedDay,
    this.selectedDay,
    required this.datesWithMood,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    final monthDate = DateTime(focusedDay.year, focusedDay.month, 1);

    return TableCalendar(
      firstDay: DateTime(focusedDay.year, focusedDay.month, 1),
      lastDay: DateTime(focusedDay.year, focusedDay.month + 1, 0),
      focusedDay: monthDate,
      selectedDayPredicate: (day) => isSameDay(day, selectedDay),
      onDaySelected: (selected, focused) => onDaySelected(selected),
      headerVisible: false,
      daysOfWeekVisible: false,
      calendarFormat: CalendarFormat.month,
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: AppColors.accentColor.withOpacity(0.22),
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: AppColors.accentColor.withOpacity(0.38),
          shape: BoxShape.circle,
        ),
        defaultTextStyle: AppTextStyles.calendarDay,
        weekendTextStyle: AppTextStyles.calendarDay,
        outsideTextStyle: AppTextStyles.calendarOutsideDay,
        cellMargin: const EdgeInsets.all(1.5),
        cellPadding: EdgeInsets.zero,
      ),
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, date, events) {
          if (datesWithMood.any((d) => isSameDay(d, date))) {
            return Positioned(
              bottom: 2,
              child: Container(
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                  color: AppColors.accentColor,
                  shape: BoxShape.circle,
                ),
              ),
            );
          }
          return null;
        },
      ),
      rowHeight: 34,
    );
  }
}
