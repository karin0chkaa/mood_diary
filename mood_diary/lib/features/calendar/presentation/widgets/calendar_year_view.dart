import 'package:flutter/material.dart';
import 'package:mood_diary/features/calendar/presentation/widgets/calendar_month_view.dart';

class CalendarYearView extends StatelessWidget {
  final int year;
  final DateTime? selectedDay;
  final Function(DateTime) onDaySelected;
  final bool twoColumns;
  final Set<DateTime> datesWithMood;

  const CalendarYearView({
    super.key,
    required this.year,
    this.selectedDay,
    required this.onDaySelected,
    required this.twoColumns,
    required this.datesWithMood,
  });

  @override
  Widget build(BuildContext context) {
    final months = List.generate(12, (index) => index + 1);

    if (twoColumns) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                '$year',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF4C4C69),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.0,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return CalendarMonthView(
                    year: year,
                    month: months[index],
                    selectedDay: selectedDay,
                    onDaySelected: onDaySelected,
                    twoColumns: true,
                    showYear: false,
                    datesWithMood: datesWithMood,
                  );
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 12,
          itemBuilder: (context, index) {
            return CalendarMonthView(
              year: year,
              month: months[index],
              selectedDay: selectedDay,
              onDaySelected: onDaySelected,
              twoColumns: false,
              showYear: index == 0,
              datesWithMood: datesWithMood,
            );
          },
        ),
      );
    }
  }
}
