import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/features/calendar/presentation/widgets/calendar_header.dart';
import 'package:mood_diary/features/calendar/presentation/widgets/calendar_month_view.dart';
import 'package:mood_diary/features/calendar/presentation/widgets/week_days_row.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool _twoColumns = false;

  final Set<DateTime> _datesWithMood = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarHeader(
        onClose: () => Navigator.pop(context),
        onToday: () {
          setState(() {
            _focusedDay = DateTime.now();
            _selectedDay = DateTime.now();
          });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Column(
          children: [
            if (_twoColumns)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Center(
                  child: Text(
                    '${_focusedDay.year}',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF4C4C69),
                    ),
                  ),
                ),
              ),

            if (!_twoColumns) ...[
              const WeekDaysRow(),
              const SizedBox(height: 8),
            ],

            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _twoColumns ? 2 : 1,
                  mainAxisSpacing: _twoColumns ? 6 : 2,
                  crossAxisSpacing: _twoColumns ? 8 : 0,
                  childAspectRatio: _twoColumns ? 0.82 : 0.98,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  final month = index + 1;
                  return CalendarMonthView(
                    year: _focusedDay.year,
                    month: month,
                    selectedDay: _selectedDay,
                    onDaySelected: (day) => setState(() => _selectedDay = day),
                    twoColumns: _twoColumns,
                    datesWithMood: _datesWithMood,
                    showYear: !_twoColumns,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.accentColor,
        child: Icon(_twoColumns ? Icons.view_agenda : Icons.view_column),
        onPressed: () {
          setState(() => _twoColumns = !_twoColumns);
        },
      ),
    );
  }
}
