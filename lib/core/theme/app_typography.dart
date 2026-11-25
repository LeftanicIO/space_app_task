import 'package:flutter/material.dart';
import 'package:space_app_task/core/theme/app_colors.dart';

abstract final class AppTypography {
  static const TextStyle display = TextStyle(
    color: AppColors.foreground,
    fontSize: 52,
    fontWeight: FontWeight.w900,
    height: 1.05,
  );

  static const TextStyle title = TextStyle(
    color: AppColors.foreground,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.5,
    letterSpacing: -0.72,
  );

  static const TextStyle body = TextStyle(
    color: AppColors.foreground,
    fontSize: 16,
    fontWeight: FontWeight.w300,
    height: 1.375,
  );

  static const TextStyle stat = TextStyle(
    color: AppColors.foreground,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 2.25,
    letterSpacing: -0.48,
  );

  static const TextStyle button = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle appBar = TextStyle(
    color: AppColors.foreground,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.72,
  );
}
