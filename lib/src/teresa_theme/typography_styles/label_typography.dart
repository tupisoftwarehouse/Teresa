import 'package:flutter/widgets.dart';

/// Provides the label typography styles used throughout Teresa.
///
/// Each static method creates a [TextStyle] using the Inter font family and
/// the provided [color].
class LabelTypography {
  LabelTypography._();

  /// Creates a bold 16 pixel label text style.
  static TextStyle BOLD_16(Color color) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w700,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  /// Creates a semibold 16 pixel label text style.
  static TextStyle SEMIBOLD_16(Color color) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w600,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  /// Creates a bold 14 pixel label text style.
  static TextStyle BOLD_14(Color color) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.w700,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  /// Creates a semibold 14 pixel label text style.
  static TextStyle SEMIBOLD_14(Color color) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.w600,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  /// Creates a bold 12 pixel label text style.
  static TextStyle BOLD_12(Color color) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 12,
      height: 1.5,
      fontWeight: FontWeight.w700,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  /// Creates a semibold 12 pixel label text style.
  static TextStyle SEMIBOLD_12(Color color) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 12,
      height: 1.5,
      fontWeight: FontWeight.w600,
      color: color,
      decoration: TextDecoration.none,
    );
  }
}
