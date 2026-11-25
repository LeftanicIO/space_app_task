import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:space_app_task/core/layout/app_layout.dart';
import 'package:space_app_task/core/theme/app_typography.dart';
import 'package:space_app_task/data/models/planet.dart';
import 'package:space_app_task/features/planet_detail/widgets/planet_detail_header.dart';
import 'package:space_app_task/features/planet_detail/widgets/planet_facts.dart';
import 'package:space_app_task/features/planet_detail/widgets/planet_media.dart';

class PlanetDetailScreen extends StatelessWidget {
  const PlanetDetailScreen({super.key, required this.planet});

  final Planet planet;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final contentWidth = math.min(width, AppLayout.maxContentWidth);
    final mediaPadding = AppLayout.mediaPadding(width);
    final textPadding = AppLayout.pagePadding(width);
    final titleSize = AppLayout.isTablet(width) ? 26.0 : 24.0;
    final titleStyle = AppTypography.title.copyWith(fontSize: titleSize);

    return Scaffold(
      body: Column(
        children: [
          PlanetDetailHeader(planet: planet),
          Expanded(
            child: SafeArea(
              top: false,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final mediaSize = math.min(
                    math.min(
                      contentWidth - mediaPadding * 2,
                      constraints.maxHeight * 0.9,
                    ),
                    AppLayout.maxMediaSize,
                  );

                  return SingleChildScrollView(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: AppLayout.maxContentWidth,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                mediaPadding,
                                9,
                                mediaPadding,
                                0,
                              ),
                              child: Center(
                                child: SizedBox.square(
                                  dimension: mediaSize,
                                  child: PlanetMedia(planet: planet),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                textPadding,
                                36,
                                textPadding,
                                33,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('About', style: titleStyle),
                                  const SizedBox(height: 8),
                                  Text(planet.about, style: AppTypography.body),
                                  const SizedBox(height: 15),
                                  PlanetFacts(planet: planet),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
