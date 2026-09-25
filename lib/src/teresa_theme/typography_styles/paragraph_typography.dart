import 'package:flutter/widgets.dart';

/// Provides the paragraph typography styles used throughout Teresa.
///
/// Each static method creates a [TextStyle] using the Inter font family and
/// the provided [color].
class ParagraphTypography {
  ParagraphTypography._();

  /// Creates a medium-weight 16 pixel paragraph text style.
  static TextStyle MEDIUM_16(Color color) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w500,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  /// Creates a regular-weight 16 pixel paragraph text style.
  static TextStyle REGULAR_16(Color color) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  /// Creates a medium-weight 14 pixel paragraph text style.
  static TextStyle MEDIUM_14(Color color) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.w500,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  /// Creates a regular-weight 14 pixel paragraph text style.
  static TextStyle REGULAR_14(Color color) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  /// Creates a medium-weight 12 pixel paragraph text style.
  static TextStyle MEDIUM_12(Color color) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 12,
      height: 1.5,
      fontWeight: FontWeight.w500,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  /// Creates a regular-weight 12 pixel paragraph text style.
  static TextStyle REGULAR_12(Color color) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 12,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: color,
      decoration: TextDecoration.none,
    );
  }
}
