import 'package:flutter/widgets.dart';

/// Provides the label icon styles used throughout Teresa.
///
/// Each static method creates an [Icon] using the corresponding label
/// typography size, weight, and the provided [icon] and [color].
class LabelIcon {
  LabelIcon._();

  /// Creates a bold 16 pixel label icon style.
  static Icon BOLD_16(IconData icon, Color color) {
    return Icon(
      icon,
      size: 16,
      color: color,
      fill: 1,
      weight: FontWeight.w700.value.toDouble(),
      fontWeight: FontWeight.w900,
    );
  }

  /// Creates a semibold 16 pixel label icon style.
  static Icon SEMIBOLD_16(IconData icon, Color color) {
    return Icon(
      icon,
      size: 16,
      color: color,
      fill: 1,
      weight: FontWeight.w600.value.toDouble(),
      fontWeight: FontWeight.w900,
    );
  }

  /// Creates a bold 14 pixel label icon style.
  static Icon BOLD_14(IconData icon, Color color) {
    return Icon(
      icon,
      size: 14,
      color: color,
      fill: 1,
      weight: FontWeight.w700.value.toDouble(),
      fontWeight: FontWeight.w900,
    );
  }

  /// Creates a semibold 14 pixel label icon style.
  static Icon SEMIBOLD_14(IconData icon, Color color) {
    return Icon(
      icon,
      size: 14,
      color: color,
      fill: 1,
      weight: FontWeight.w600.value.toDouble(),
      fontWeight: FontWeight.w900,
    );
  }

  /// Creates a bold 12 pixel label icon style.
  static Icon BOLD_12(IconData icon, Color color) {
    return Icon(
      icon,
      size: 12,
      color: color,
      fill: 1,
      weight: FontWeight.w700.value.toDouble(),
      fontWeight: FontWeight.w900,
    );
  }

  /// Creates a semibold 12 pixel label icon style.
  static Icon SEMIBOLD_12(IconData icon, Color color) {
    return Icon(
      icon,
      size: 12,
      color: color,
      fill: 1,
      weight: FontWeight.w600.value.toDouble(),
      fontWeight: FontWeight.w900,
    );
  }
}
