import 'package:flutter/material.dart';
import 'package:mood_diary/features/emotions/domain/emotion_entry.dart';

class EmotionStorage extends ChangeNotifier {
  final List<EmotionEntry> _entries = [];

  List<EmotionEntry> get entries => List.unmodifiable(_entries);

  void save(EmotionEntry entry) {
    _entries.removeWhere(
      (e) =>
          e.date.year == entry.date.year &&
          e.date.month == entry.date.month &&
          e.date.day == entry.date.day,
    );

    _entries.add(entry);
    notifyListeners();
  }

  bool hasEntry(DateTime date) {
    return _entries.any(
      (e) =>
          e.date.year == date.year &&
          e.date.month == date.month &&
          e.date.day == date.day,
    );
  }
}
