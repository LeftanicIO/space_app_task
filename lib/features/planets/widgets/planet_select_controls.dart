import 'package:flutter/material.dart';
import 'package:space_app_task/core/widgets/circle_icon_button.dart';
import 'package:space_app_task/data/models/planet.dart';

class PlanetSelectControls extends StatelessWidget {
  const PlanetSelectControls({
    super.key,
    required this.planet,
    required this.canGoBack,
    required this.canGoForward,
    required this.onBack,
    required this.onForward,
    required this.onExplore,
  });

  final Planet planet;
  final bool canGoBack;
  final bool canGoForward;
  final VoidCallback onBack;
  final VoidCallback onForward;
  final VoidCallback onExplore;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleIconButton(
                      icon: Icons.arrow_back_rounded,
                      onPressed: canGoBack ? onBack : null,
                      tooltip: 'Previous planet',
                    ),
                    CircleIconButton(
                      icon: Icons.arrow_forward_rounded,
                      onPressed: canGoForward ? onForward : null,
                      tooltip: 'Next planet',
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: FilledButton(
                    onPressed: onExplore,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 180),
                          child: Text(
                            'Explore ${planet.name}',
                            key: ValueKey(planet.name),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.arrow_forward_rounded, size: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
