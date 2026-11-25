import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:space_app_task/core/constants/app_assets.dart';
import 'package:space_app_task/core/layout/app_layout.dart';
import 'package:space_app_task/core/theme/app_typography.dart';
import 'package:space_app_task/features/planets/planet_select_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final titleSize = (size.width * 0.14).clamp(44.0, 84.0).toDouble();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.homeBackground,
            fit: BoxFit.cover,
            cacheHeight: (size.height * devicePixelRatio).round(),
          ),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final contentWidth = math.min(
                  constraints.maxWidth,
                  AppLayout.maxContentWidth,
                );
                final horizontalPadding = AppLayout.isTablet(constraints.maxWidth)
                    ? 32.0
                    : 20.0;

                return Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding,
                            vertical: 24,
                          ),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: contentWidth),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Explore\nThe\nUniverse',
                                style: AppTypography.display.copyWith(
                                  fontSize: titleSize,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        horizontalPadding,
                        8,
                        horizontalPadding,
                        24,
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 560),
                        child: SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: FilledButton(
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (_) => const PlanetSelectScreen(),
                              ),
                            ),
                            child: const Row(
                              children: [
                                Text('Explore'),
                                Spacer(),
                                Icon(Icons.arrow_forward_rounded, size: 25),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
