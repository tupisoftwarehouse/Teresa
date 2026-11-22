import "package:flutter/widgets.dart";

/// Defines the primary color palette used throughout Teresa.
///
/// Each static property exposes its corresponding [Color].
///
/// The palette ranges from [VALUE_900], the darkest value, to [VALUE_50],
/// the lightest value.
class PrimaryColor {
  PrimaryColor._();

  /// The darkest primary color.
  static const Color VALUE_900 = Color(0xFF332100);

  /// A very dark primary color.
  static const Color VALUE_800 = Color(0xFF664200);

  /// A dark primary color.
  static const Color VALUE_700 = Color(0xFF996300);

  /// A moderately dark primary color.
  static const Color VALUE_600 = Color(0xFFCC8400);

  /// The primary brand color.
  static const Color VALUE_500 = Color(0xFFFFA500);

  /// A moderately light primary color.
  static const Color VALUE_400 = Color(0xFFFFB733);

  /// A light primary color.
  static const Color VALUE_300 = Color(0xFFFFC966);

  /// A very light primary color.
  static const Color VALUE_200 = Color(0xFFFFDB99);

  /// An extremely light primary color.
  static const Color VALUE_100 = Color(0xFFFFEDCC);

  /// The lightest primary color.
  static const Color VALUE_50 = Color(0xFFFFF6E6);
}
