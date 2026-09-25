import 'package:flutter/widgets.dart';

/// Provides the paragraph icon styles used throughout Teresa.
///
/// Each static method creates an [Icon] using the corresponding paragraph
/// typography size, weight, and the provided [icon] and [color].
class ParagraphIcon {
  ParagraphIcon._();

  /// Creates a medium-weight 16 pixel paragraph icon style.
  static Icon MEDIUM_16(IconData icon, Color color) {
    return Icon(
      icon,
      size: 16,
      color: color,
      fill: 1,
      weight: FontWeight.w500.value.toDouble(),
      fontWeight: FontWeight.w900,
    );
  }

  /// Creates a regular-weight 16 pixel paragraph icon style.
  static Icon REGULAR_16(IconData icon, Color color) {
    return Icon(
      icon,
      size: 16,
      color: color,
      fill: 1,
      weight: FontWeight.w400.value.toDouble(),
      fontWeight: FontWeight.w900,
    );
  }

  /// Creates a medium-weight 14 pixel paragraph icon style.
  static Icon MEDIUM_14(IconData icon, Color color) {
    return Icon(
      icon,
      size: 14,
      color: color,
      fill: 1,
      weight: FontWeight.w500.value.toDouble(),
      fontWeight: FontWeight.w900,
    );
  }

  /// Creates a regular-weight 14 pixel paragraph icon style.
  static Icon REGULAR_14(IconData icon, Color color) {
    return Icon(
      icon,
      size: 14,
      color: color,
      fill: 1,
      weight: FontWeight.w400.value.toDouble(),
      fontWeight: FontWeight.w900,
    );
  }

  /// Creates a medium-weight 12 pixel paragraph icon style.
  static Icon MEDIUM_12(IconData icon, Color color) {
    return Icon(
      icon,
      size: 12,
      color: color,
      fill: 1,
      weight: FontWeight.w500.value.toDouble(),
      fontWeight: FontWeight.w900,
    );
  }

  /// Creates a regular-weight 12 pixel paragraph icon style.
  static Icon REGULAR_12(IconData icon, Color color) {
    return Icon(
      icon,
      size: 12,
      color: color,
      fill: 1,
      weight: FontWeight.w400.value.toDouble(),
      fontWeight: FontWeight.w900,
    );
  }
}
