String formatNumber(num value) {
  if (value == value.roundToDouble()) return value.toInt().toString();
  return value.toString();
}

String formatMeasurement(num value) {
  if (value == value.roundToDouble()) return value.toInt().toString();
  return value.toStringAsFixed(2);
}
