import 'package:flutter/material.dart';
import 'package:space_app_task/core/theme/app_colors.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.tooltip,
    this.size = 43,
    this.iconSize = 23,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String tooltip;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      tooltip: tooltip,
      icon: Icon(icon, size: iconSize),
      style: IconButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.foreground,
        disabledBackgroundColor: AppColors.accent.withValues(alpha: 0.35),
        disabledForegroundColor: AppColors.foreground.withValues(alpha: 0.6),
        fixedSize: Size.square(size),
        minimumSize: Size.square(size),
        maximumSize: Size.square(size),
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
