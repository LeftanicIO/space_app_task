import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:space_app_task/data/planets.dart';
import 'package:space_app_task/features/planet_detail/planet_detail_screen.dart';
import 'package:space_app_task/features/planets/widgets/explore_header.dart';
import 'package:space_app_task/features/planets/widgets/planet_preview.dart';
import 'package:space_app_task/features/planets/widgets/planet_select_controls.dart';

class PlanetSelectScreen extends StatefulWidget {
  const PlanetSelectScreen({super.key});

  @override
  State<PlanetSelectScreen> createState() => _PlanetSelectScreenState();
}

class _PlanetSelectScreenState extends State<PlanetSelectScreen> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool get _canGoBack => _currentIndex > 0;

  bool get _canGoForward => _currentIndex < planets.length - 1;

  void _goTo(int delta) {
    if ((delta < 0 && !_canGoBack) || (delta > 0 && !_canGoForward)) return;
    _pageController.animateToPage(
      _currentIndex + delta,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
    );
  }

  void _openSelectedPlanet() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => PlanetDetailScreen(planet: planets[_currentIndex]),
      ),
    );
  }

  Widget _buildPages() {
    return PageView.builder(
      controller: _pageController,
      itemCount: planets.length,
      onPageChanged: (index) {
        if (index != _currentIndex) {
          setState(() => _currentIndex = index);
        }
      },
      itemBuilder: (context, index) {
        return PlanetPreview(planet: planets[index]);
      },
    );
  }

  Widget _buildControls() {
    return PlanetSelectControls(
      planet: planets[_currentIndex],
      canGoBack: _canGoBack,
      canGoForward: _canGoForward,
      onBack: () => _goTo(-1),
      onForward: () => _goTo(1),
      onExplore: _openSelectedPlanet,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final topPadding = MediaQuery.paddingOf(context).top;
    final bottomPadding = MediaQuery.paddingOf(context).bottom;
    final headerHeight = math.max(
      math
          .min(
            (size.width * 0.8).clamp(220.0, 340.0),
            size.height * 0.42,
          )
          .clamp(180.0, 340.0)
          .toDouble(),
      topPadding + 160,
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final controlsHeight = 141 + bottomPadding;
          final previewHeight =
              constraints.maxHeight - headerHeight - controlsHeight;

          if (previewHeight >= 120) {
            return Column(
              children: [
                ExploreHeader(height: headerHeight),
                Expanded(child: _buildPages()),
                _buildControls(),
              ],
            );
          }

          const minimumPreviewHeight = 140.0;
          return SingleChildScrollView(
            child: SizedBox(
              height: headerHeight + minimumPreviewHeight + controlsHeight,
              child: Column(
                children: [
                  ExploreHeader(height: headerHeight),
                  SizedBox(
                    height: minimumPreviewHeight,
                    child: _buildPages(),
                  ),
                  _buildControls(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
