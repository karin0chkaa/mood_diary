

import 'package:mood_diary/features/emotions/domain/emotion.dart';

class EmotionEntry {
  final DateTime date;
  final Emotion emotion;
  final List<String> details;
  final double stress;
  final double selfEsteem;
  final String note;

  EmotionEntry({
    required this.date,
    required this.emotion,
    required this.details,
    required this.stress,
    required this.selfEsteem,
    required this.note,
  });
}
