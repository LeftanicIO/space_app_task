import 'package:flutter/material.dart';
import 'package:space_app_task/core/theme/app_typography.dart';
import 'package:space_app_task/core/utils/number_formatter.dart';
import 'package:space_app_task/data/models/planet.dart';

List<String> buildPlanetFacts(Planet planet) {
  return [
    if (planet.distanceKm > 0)
      'Distance from Sun (km) : ${formatNumber(planet.distanceKm)}',
    if (planet.dayLengthHours > 0)
      'Length of Day (hours) : ${formatMeasurement(planet.dayLengthHours)}',
    if (planet.orbitalPeriodYears > 0)
      'Orbital Period (Earth years) : ${formatNumber(planet.orbitalPeriodYears)}',
    'Radius (km) : ${formatMeasurement(planet.radiusKm)}',
    'Mass (kg) : ${planet.mass}',
    'Gravity (m/s²) : ${formatNumber(planet.gravity)}',
    'Surface Area (km²) : ${planet.surfaceArea}',
  ];
}

class PlanetFacts extends StatelessWidget {
  const PlanetFacts({super.key, required this.planet});

  final Planet planet;

  @override
  Widget build(BuildContext context) {
    return Text(
      buildPlanetFacts(planet).join('\n'),
      style: AppTypography.stat,
    );
  }
}
