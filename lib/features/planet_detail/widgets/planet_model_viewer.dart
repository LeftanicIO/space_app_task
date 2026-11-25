import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_scene/scene.dart';
import 'package:space_app_task/core/theme/app_colors.dart';

class PlanetModelViewer extends StatefulWidget {
  const PlanetModelViewer({
    super.key,
    required this.modelAsset,
    required this.fallbackImageAsset,
    required this.semanticLabel,
  });

  final String modelAsset;
  final String fallbackImageAsset;
  final String semanticLabel;

  @override
  State<PlanetModelViewer> createState() => _PlanetModelViewerState();
}

class _PlanetModelViewerState extends State<PlanetModelViewer> {
  Scene? _scene;
  bool _failed = false;
  int _loadGeneration = 0;

  @override
  void initState() {
    super.initState();
    unawaited(_loadModel());
  }

  Future<void> _loadModel() async {
    final generation = ++_loadGeneration;
    Scene? scene;

    try {
      scene = Scene();
      final node = await Node.fromGlbAsset(
        widget.modelAsset,
      ).timeout(const Duration(seconds: 15));

      if (!mounted || generation != _loadGeneration) {
        scene.dispose();
        return;
      }

      scene.add(node);
      final bounds = node.combinedWorldBounds;
      if (bounds != null) {
        scene.camera = PerspectiveCamera.framing(bounds, margin: 0.7);
      }

      setState(() => _scene = scene);
    } catch (_) {
      scene?.dispose();
      if (mounted && generation == _loadGeneration) {
        setState(() => _failed = true);
      }
    }
  }

  @override
  void didUpdateWidget(covariant PlanetModelViewer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.modelAsset != widget.modelAsset) {
      _scene?.dispose();
      _scene = null;
      _failed = false;
      unawaited(_loadModel());
    }
  }

  @override
  void dispose() {
    _loadGeneration++;
    _scene?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scene = _scene;

    if (scene != null) {
      return RepaintBoundary(
        child: Semantics(
          label: widget.semanticLabel,
          image: true,
          child: SceneView(
            scene,
            autoTick: false,
            pixelRatio: math.min(MediaQuery.devicePixelRatioOf(context), 2.0),
          ),
        ),
      );
    }

    if (_failed) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
          final cacheWidth = constraints.maxWidth.isFinite
              ? (constraints.maxWidth * devicePixelRatio).round()
              : null;

          return Image.asset(
            widget.fallbackImageAsset,
            fit: BoxFit.contain,
            cacheWidth: cacheWidth,
            filterQuality: FilterQuality.medium,
            semanticLabel: widget.semanticLabel,
          );
        },
      );
    }

    return const Center(
      child: SizedBox.square(
        dimension: 30,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          color: AppColors.accent,
        ),
      ),
    );
  }
}
