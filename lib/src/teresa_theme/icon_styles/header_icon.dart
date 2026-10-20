import "package:flutter/widgets.dart";

/// Provides the heading icon styles used throughout Teresa.
///
/// Each static method creates an [Icon] using the corresponding heading
/// typography size, weight, and the provided [icon] and [color].
class HeaderIcon {
  HeaderIcon._();

  /// Creates the largest heading icon style.
  static Icon HEADING_1(IconData icon, Color color) {
    return Icon(
      icon,
      size: 68,
      color: color,
      fill: 1,
      weight: FontWeight.w900.value.toDouble(),
      fontWeight: FontWeight.w900,
    );
  }

  /// Creates the second-largest heading icon style.
  static Icon HEADING_2(IconData icon, Color color) {
    return Icon(
      icon,
      size: 55,
      color: color,
      fill: 1,
      weight: FontWeight.w900.value.toDouble(),
      fontWeight: FontWeight.w900,
    );
  }

  /// Creates the third-largest heading icon style.
  static Icon HEADING_3(IconData icon, Color color) {
    return Icon(
      icon,
      size: 42,
      color: color,
      fill: 1,
      weight: FontWeight.w900.value.toDouble(),
      fontWeight: FontWeight.w900,
    );
  }

  /// Creates the fourth heading icon style.
  static Icon HEADING_4(IconData icon, Color color) {
    return Icon(
      icon,
      size: 26,
      color: color,
      fill: 1,
      weight: FontWeight.w900.value.toDouble(),
      fontWeight: FontWeight.w900,
    );
  }

  /// Creates the fifth heading icon style.
  static Icon HEADING_5(IconData icon, Color color) {
    return Icon(
      icon,
      size: 18,
      color: color,
      fill: 1,
      weight: FontWeight.w900.value.toDouble(),
      fontWeight: FontWeight.w900,
    );
  }

  /// Creates the sixth heading icon style.
  static Icon HEADING_6(IconData icon, Color color) {
    return Icon(
      icon,
      size: 14,
      color: color,
      fill: 1,
      weight: FontWeight.w900.value.toDouble(),
      fontWeight: FontWeight.w900,
    );
  }
}
