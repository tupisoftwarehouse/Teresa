import "package:flutter/widgets.dart";

/// Defines the warning color palette used throughout Teresa.
///
/// Each static property exposes its corresponding [Color].
///
/// The palette ranges from [VALUE_900], the darkest value, to [VALUE_50],
/// the lightest value.
class WarningColor {
  WarningColor._();

  /// The darkest warning color.
  static const Color VALUE_900 = Color(0xFF321501);

  /// A very dark warning color.
  static const Color VALUE_800 = Color(0xFF632A03);

  /// A dark warning color.
  static const Color VALUE_700 = Color(0xFF953F04);

  /// A moderately dark warning color.
  static const Color VALUE_600 = Color(0xFFC75505);

  /// The primary warning color.
  static const Color VALUE_500 = Color(0xFFF96A06);

  /// A moderately light warning color.
  static const Color VALUE_400 = Color(0xFFFA8838);

  /// A light warning color.
  static const Color VALUE_300 = Color(0xFFFAAC6A);

  /// A very light warning color.
  static const Color VALUE_200 = Color(0xFFFCC39C);

  /// An extremely light warning color.
  static const Color VALUE_100 = Color(0xFFFEE1CD);

  /// The lightest warning color.
  static const Color VALUE_50 = Color(0xFFFEF0E6);
}
