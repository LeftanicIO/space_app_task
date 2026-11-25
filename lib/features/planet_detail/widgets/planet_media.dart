import 'package:flutter/material.dart';
import 'package:space_app_task/data/models/planet.dart';
import 'package:space_app_task/features/planet_detail/widgets/planet_model_viewer.dart';

class PlanetMedia extends StatelessWidget {
  const PlanetMedia({super.key, required this.planet});

  final Planet planet;

  @override
  Widget build(BuildContext context) {
    final modelAsset = planet.modelAsset;
    if (modelAsset != null) {
      return PlanetModelViewer(
        modelAsset: modelAsset,
        fallbackImageAsset: planet.imageAsset,
        semanticLabel: '${planet.name} 3D model',
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
        final cacheWidth = constraints.maxWidth.isFinite
            ? (constraints.maxWidth * devicePixelRatio).round()
            : null;

        return Image.asset(
          planet.imageAsset,
          fit: BoxFit.contain,
          cacheWidth: cacheWidth,
          filterQuality: FilterQuality.medium,
          semanticLabel: planet.name,
        );
      },
    );
  }
}
