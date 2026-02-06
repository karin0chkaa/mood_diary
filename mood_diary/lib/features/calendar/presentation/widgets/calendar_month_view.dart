import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/core/constants/app_text_style.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarMonthView extends StatelessWidget {
  final int year;
  final int month;
  final DateTime? selectedDay;
  final Function(DateTime) onDaySelected;
  final bool twoColumns;
  final bool showYear;
  final Set<DateTime> datesWithMood;

  const CalendarMonthView({
    super.key,
    required this.year,
    required this.month,
    this.selectedDay,
    required this.onDaySelected,
    required this.twoColumns,
    required this.datesWithMood,
    this.showYear = false,
  });

  String get monthName {
    const names = [
      'Январь',
      'Февраль',
      'Март',
      'Апрель',
      'Май',
      'Июнь',
      'Июль',
      'Август',
      'Сентябрь',
      'Октябрь',
      'Ноябрь',
      'Декабрь',
    ];
    return names[month - 1];
  }

  BoxDecoration _dayDecoration({double opacity = 0.25}) {
    return BoxDecoration(
      color: AppColors.accentColor.withOpacity(opacity),
      shape: BoxShape.circle,
    );
  }

  TextStyle _dayTextStyle() => AppTextStyles.calendarTextStyle;

  @override
  Widget build(BuildContext context) {
    final isCompact = twoColumns;

    return Container(
      padding: isCompact
          ? const EdgeInsets.symmetric(horizontal: 2, vertical: 2)
          : EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showYear)
            Padding(
              padding: const EdgeInsets.only(bottom: 4, left: 2),
              child: Text(
                '$year',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFBCBCBF),
                ),
              ),
            ),

          Padding(
            padding: EdgeInsets.only(
              left: isCompact ? 2 : 0,
              bottom: isCompact ? 2 : 4,
            ),
            child: Text(
              monthName,
              style: _dayTextStyle().copyWith(
                fontSize: isCompact ? 13.5 : 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          Expanded(
            child: TableCalendar(
              firstDay: DateTime(year, month, 1),
              lastDay: DateTime(year, month + 1, 0),
              focusedDay: DateTime(year, month, 1),
              selectedDayPredicate: (day) => isSameDay(selectedDay, day),
              onDaySelected: (selected, focused) => onDaySelected(selected),
              headerVisible: false,
              daysOfWeekVisible: false,
              calendarFormat: CalendarFormat.month,
              sixWeekMonthsEnforced: false,
              rowHeight: isCompact ? 20 : 34,
              calendarStyle: CalendarStyle(
                defaultTextStyle: _dayTextStyle().copyWith(
                  fontSize: isCompact ? 10 : 15,
                ),
                weekendTextStyle: _dayTextStyle().copyWith(
                  fontSize: isCompact ? 10 : 15,
                ),
                outsideTextStyle: _dayTextStyle().copyWith(
                  fontSize: isCompact ? 10 : 15,
                  color: AppColors.textPrimaryColor.withOpacity(0.4),
                ),
                todayTextStyle: _dayTextStyle().copyWith(
                  fontSize: isCompact ? 10 : 15,
                ),
                todayDecoration: _dayDecoration(opacity: 0.22),
                selectedDecoration: _dayDecoration(opacity: 0.38),
                cellMargin: EdgeInsets.symmetric(
                  vertical: isCompact ? 0 : 2,
                  horizontal: isCompact ? 1 : 2,
                ),
                cellPadding: EdgeInsets.zero,
                outsideDaysVisible: false,
              ),
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, date, events) {
                  final hasMood = datesWithMood.any((d) => isSameDay(d, date));
                  if (!hasMood) return null;

                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: twoColumns ? 1 : 4),
                      child: Container(
                        width: twoColumns ? 4 : 6,
                        height: twoColumns ? 4 : 6,
                        decoration: const BoxDecoration(
                          color: AppColors.accentColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
