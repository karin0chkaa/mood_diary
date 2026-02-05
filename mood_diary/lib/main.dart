import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/presentation/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Дневник настроения',
      theme: ThemeData(
        fontFamily: 'Nunito',
        textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Nunito'),
        primaryColor: AppColors.textPrimaryColor,
        scaffoldBackgroundColor: AppColors.primaryBackgroundColor,
      ),
      home: const HomeScreen(),
    );
  }
}
