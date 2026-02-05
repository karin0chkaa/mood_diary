import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:mood_diary/presentation/widgets/calendar_header.dart';
import 'package:mood_diary/core/constants/app_colors.dart';

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
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          children: [
            if (_twoColumns)
              Padding(
                padding: const EdgeInsets.only(bottom: 26),
                child: Text(
                  '${_focusedDay.year}',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800, // ExtraBold
                    color: AppColors.textSecondaryColor,
                  ),
                ),
              ),

            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _twoColumns ? 2 : 1,
                  mainAxisSpacing: _twoColumns ? 12 : 20,
                  crossAxisSpacing: _twoColumns ? 16 : 0,
                  childAspectRatio: _twoColumns ? 0.75 : 0.85,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  final month = index + 1;
                  final monthDate = DateTime(_focusedDay.year, month, 1);
                  final isCompact = _twoColumns;

                  return Container(
                    padding: isCompact
                        ? const EdgeInsets.symmetric(horizontal: 4, vertical: 4)
                        : EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!isCompact && index == 0) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(7, (index) {
                              return SizedBox(
                                width: 38,
                                child: Center(
                                  child: Text(
                                    _getDayOfWeekShort(index + 1),
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600, // semiBold
                                      color: AppColors.textPrimaryColor,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 20),

                          Text(
                            '${_focusedDay.year}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],

                        Padding(
                          padding: EdgeInsets.only(
                            left: isCompact ? 4 : 0,
                            top: (!isCompact && index > 0) ? 20 : 0,
                          ),
                          child: Text(
                            _monthName(month),
                            style: TextStyle(
                              fontSize: isCompact ? 14 : 22,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textSecondaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: isCompact ? 4 : 6),

                        Expanded(
                          child: TableCalendar(
                            firstDay: DateTime(_focusedDay.year, month, 1),
                            lastDay: DateTime(_focusedDay.year, month + 1, 0),
                            focusedDay: monthDate,
                            selectedDayPredicate: (day) =>
                                isSameDay(_selectedDay, day),
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                _selectedDay = selectedDay;
                                _focusedDay = focusedDay;
                              });
                            },
                            headerVisible: false,
                            daysOfWeekVisible: false,
                            calendarFormat: CalendarFormat.month,
                            calendarStyle: CalendarStyle(
                              defaultTextStyle: TextStyle(
                                fontSize: isCompact ? 10 : 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondaryColor,
                              ),
                              weekendTextStyle: TextStyle(
                                fontSize: isCompact ? 10 : 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondaryColor,
                              ),
                              outsideTextStyle: TextStyle(
                                fontSize: isCompact ? 10 : 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondaryColor.withOpacity(
                                  0.5,
                                ),
                              ),
                              todayTextStyle: TextStyle(
                                fontSize: isCompact ? 10 : 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondaryColor,
                              ),
                              todayDecoration: BoxDecoration(
                                color: AppColors.primaryButtonColor.withOpacity(
                                  0.22,
                                ),
                                shape: BoxShape.circle,
                              ),
                              selectedDecoration: BoxDecoration(
                                color: AppColors.primaryButtonColor.withOpacity(
                                  0.38,
                                ),
                                shape: BoxShape.circle,
                              ),
                              cellMargin: isCompact
                                  ? const EdgeInsets.all(1)
                                  : const EdgeInsets.all(1.5),
                              cellPadding: EdgeInsets.zero,
                              outsideDaysVisible: false,
                            ),
                            daysOfWeekStyle: const DaysOfWeekStyle(
                              decoration: BoxDecoration(),
                            ),
                            calendarBuilders: CalendarBuilders(
                              markerBuilder: (context, date, events) {
                                if (_datesWithMood.any(
                                  (d) => isSameDay(d, date),
                                )) {
                                  return Positioned(
                                    bottom: isCompact ? 1 : 2,
                                    child: Container(
                                      width: isCompact ? 3 : 5,
                                      height: isCompact ? 3 : 5,
                                      decoration: const BoxDecoration(
                                        color: AppColors.primaryButtonColor,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  );
                                }
                                return null;
                              },
                            ),
                            rowHeight: isCompact ? 24 : 34,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryButtonColor,
        child: Icon(_twoColumns ? Icons.view_agenda : Icons.view_column),
        onPressed: () {
          setState(() => _twoColumns = !_twoColumns);
        },
      ),
    );
  }

  String _monthName(int month) {
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

  String _getDayOfWeekShort(int weekday) {
    const names = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
    return names[weekday - 1];
  }
}
