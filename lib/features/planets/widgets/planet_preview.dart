import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:space_app_task/data/models/planet.dart';

class PlanetPreview extends StatelessWidget {
  const PlanetPreview({super.key, required this.planet});

  final Planet planet;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = math.min(
          math.min(
            constraints.maxWidth * 0.82,
            constraints.maxHeight * 0.86,
          ),
          460.0,
        );
        final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);

        return Center(
          child: Image.asset(
            planet.imageAsset,
            width: size,
            height: size,
            fit: BoxFit.contain,
            cacheWidth: (size * devicePixelRatio).round(),
            filterQuality: FilterQuality.medium,
            semanticLabel: planet.name,
          ),
        );
      },
    );
  }
}
