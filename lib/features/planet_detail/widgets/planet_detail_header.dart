import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:space_app_task/core/constants/app_assets.dart';
import 'package:space_app_task/core/layout/app_layout.dart';
import 'package:space_app_task/core/theme/app_colors.dart';
import 'package:space_app_task/core/theme/app_typography.dart';
import 'package:space_app_task/core/widgets/circle_icon_button.dart';
import 'package:space_app_task/data/models/planet.dart';

class PlanetDetailHeader extends StatelessWidget {
  const PlanetDetailHeader({super.key, required this.planet});

  final Planet planet;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final topPadding = MediaQuery.paddingOf(context).top;
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final textScaler = MediaQuery.textScalerOf(context);
    final titleSize = AppLayout.isTablet(width) ? 26.0 : 24.0;
    final titleStyle = AppTypography.title.copyWith(fontSize: titleSize);
    final textPadding = AppLayout.pagePadding(width);
    final contentWidth = math.min(width, AppLayout.maxContentWidth);

    final titlePainter = TextPainter(
      text: TextSpan(text: planet.title, style: titleStyle),
      textDirection: Directionality.of(context),
      textScaler: textScaler,
      maxLines: 2,
    )..layout(maxWidth: contentWidth - textPadding * 2);
    final titleHeight = titlePainter.height;
    titlePainter.dispose();

    final designHeight = (width * 0.384).clamp(144.0, 220.0).toDouble();
    final contentHeight = 101 + titleHeight + 7;
    final maxVisualHeight = math.max(144.0, screenHeight * 0.32);
    final headerContentHeight = math.max(
      contentHeight,
      math.min(designHeight, maxVisualHeight),
    );
    final headerHeight = topPadding + headerContentHeight;
    final titleTop = topPadding + headerContentHeight - 7 - titleHeight;

    return Semantics(
      header: true,
      child: SizedBox(
        width: double.infinity,
        height: headerHeight,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AppAssets.halfEarth,
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
                cacheWidth: (width * devicePixelRatio).round(),
              ),
            ),
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, AppColors.background],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.45, 0.85],
                  ),
                ),
              ),
            ),
            Positioned(
              top: topPadding + 26,
              left: 0,
              right: 0,
              child: Text(
                planet.name,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: titleStyle,
              ),
            ),
            Positioned(
              top: topPadding + 22,
              left: 16,
              child: CircleIconButton(
                icon: Icons.arrow_back_rounded,
                onPressed: () => Navigator.maybePop(context),
                tooltip: 'Back',
                size: 42,
                iconSize: 23,
              ),
            ),
            Positioned(
              top: titleTop,
              left: 0,
              right: 0,
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: contentWidth),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: textPadding),
                    child: Text(
                      planet.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: titleStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
