import 'package:flutter/material.dart';
import 'package:mood_diary/core/theme/app_theme.dart';
import 'package:mood_diary/features/emotions/data/emotion_storage.dart';
import 'package:mood_diary/features/home_screen/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EmotionStorage(),
      child: MaterialApp(theme: AppTheme.light, home: const HomeScreen()),
    );
  }
}
