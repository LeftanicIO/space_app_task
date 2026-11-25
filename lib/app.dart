import 'package:flutter/material.dart';
import 'package:space_app_task/core/theme/app_theme.dart';
import 'package:space_app_task/features/home/home_screen.dart';

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const HomeScreen(),
    );
  }
}
