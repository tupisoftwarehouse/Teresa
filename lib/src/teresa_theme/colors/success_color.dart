import "package:flutter/widgets.dart";

/// Defines the success color palette used throughout Teresa.
///
/// Each static property exposes its corresponding [Color].
///
/// The palette ranges from [VALUE_900], the darkest value, to [VALUE_50],
/// the lightest value.
class SuccessColor {
  SuccessColor._();

  /// The darkest success color.
  static const Color VALUE_900 = Color(0xFF1E2D06);

  /// A very dark success color.
  static const Color VALUE_800 = Color(0xFF3D5B0B);

  /// A dark success color.
  static const Color VALUE_700 = Color(0xFF5B8811);

  /// A moderately dark success color.
  static const Color VALUE_600 = Color(0xFF79B516);

  /// The primary success color.
  static const Color VALUE_500 = Color(0xFF98E31C);

  /// A moderately light success color.
  static const Color VALUE_400 = Color(0xFFACE949);

  /// A light success color.
  static const Color VALUE_300 = Color(0xFFC1EE77);

  /// A very light success color.
  static const Color VALUE_200 = Color(0xFFD6F4A4);

  /// An extremely light success color.
  static const Color VALUE_100 = Color(0xFFEAF9D2);

  /// The lightest success color.
  static const Color VALUE_50 = Color(0xFFF5FCE8);
}
