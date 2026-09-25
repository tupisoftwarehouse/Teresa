import 'package:flutter/widgets.dart';

/// Provides the heading typography styles used throughout Teresa.
///
/// Each static method creates a [TextStyle] using the Inter font family and
/// the provided [color].
class HeaderTypography {
  HeaderTypography._();

  /// Creates the largest heading text style.
  static TextStyle HEADING_1(Color color) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 68,
      height: 1.25,
      fontWeight: FontWeight.w900,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  /// Creates the second-largest heading text style.
  static TextStyle HEADING_2(Color color) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 55,
      height: 1.25,
      fontWeight: FontWeight.w900,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  /// Creates the third-largest heading text style.
  static TextStyle HEADING_3(Color color) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 42,
      height: 1.25,
      fontWeight: FontWeight.w900,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  /// Creates the fourth heading text style.
  static TextStyle HEADING_4(Color color) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 26,
      height: 1.25,
      fontWeight: FontWeight.w900,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  /// Creates the fifth heading text style.
  static TextStyle HEADING_5(Color color) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 18,
      height: 1.1111111,
      fontWeight: FontWeight.w900,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  /// Creates the sixth heading text style.
  static TextStyle HEADING_6(Color color) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 14,
      height: 1.25,
      fontWeight: FontWeight.w900,
      color: color,
      decoration: TextDecoration.none,
    );
  }
}
