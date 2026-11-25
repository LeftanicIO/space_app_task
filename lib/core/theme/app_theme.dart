import 'package:flutter/material.dart';
import 'package:space_app_task/core/theme/app_colors.dart';
import 'package:space_app_task/core/theme/app_typography.dart';

abstract final class AppTheme {
  static ThemeData get dark {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.accent,
      brightness: Brightness.dark,
    ).copyWith(
      primary: AppColors.accent,
      onPrimary: AppColors.foreground,
      surface: AppColors.background,
      onSurface: AppColors.foreground,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'SpaceGrotesk',
      textTheme: const TextTheme(
        displayLarge: AppTypography.display,
        titleLarge: AppTypography.title,
        bodyLarge: AppTypography.body,
        bodyMedium: AppTypography.body,
        labelLarge: AppTypography.button,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.foreground,
          textStyle: AppTypography.button,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.foreground),
    );
  }
}
