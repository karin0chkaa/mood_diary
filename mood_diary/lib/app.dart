import 'package:flutter/material.dart';
import 'package:mood_diary/core/theme/app_theme.dart';
import 'package:mood_diary/features/home_screen/presentation/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.light, home: const HomeScreen());
  }
}
