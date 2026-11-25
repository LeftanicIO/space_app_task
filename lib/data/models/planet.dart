class Planet {
  const Planet({
    required this.name,
    required this.imageAsset,
    required this.title,
    required this.about,
    required this.distanceKm,
    required this.dayLengthHours,
    required this.orbitalPeriodYears,
    required this.radiusKm,
    required this.mass,
    required this.gravity,
    required this.surfaceArea,
    this.modelAsset,
  });

  final String name;
  final String imageAsset;
  final String? modelAsset;
  final String title;
  final String about;
  final num distanceKm;
  final num dayLengthHours;
  final num orbitalPeriodYears;
  final num radiusKm;
  final String mass;
  final num gravity;
  final String surfaceArea;
}
