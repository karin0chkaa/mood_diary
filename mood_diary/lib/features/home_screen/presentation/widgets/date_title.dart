import 'package:flutter/cupertino.dart';

class DateTitle extends StatelessWidget {
  final DateTime date;

  const DateTitle({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final months = [
      'января',
      'февраля',
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

    return Text(
      '${date.day} ${months[date.month - 1]} '
      '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}',
    );
  }
}
