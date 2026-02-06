import 'package:flutter/material.dart';
import 'package:mood_diary/features/calendar/presentation/screens/calendar_screen.dart';
import 'package:mood_diary/features/emotions/presentation/screens/emotion_screen.dart';
import 'package:mood_diary/features/shell/presentation/widgets/home_app_bar.dart';
import 'package:mood_diary/features/statistics/presentation/statistics_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final _screens = const [EmotionScreen(), StatisticsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        onCalendarTap: _openCalendar,
        selectedIndex: _selectedIndex,
        onTabChanged: (index) => setState(() => _selectedIndex = index),
      ),
      body: IndexedStack(index: _selectedIndex, children: _screens),
    );
  }

  void _openCalendar() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CalendarScreen()),
    );
  }
}
