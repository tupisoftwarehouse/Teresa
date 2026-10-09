import "package:flutter/widgets.dart";

/// Defines the danger color palette used throughout Teresa.
///
/// Each static property exposes its corresponding [Color].
///
/// The palette ranges from [VALUE_900], the darkest value, to [VALUE_50],
/// the lightest value.
class DangerColor {
  DangerColor._();

  /// The darkest danger color.
  static const Color VALUE_900 = Color(0xFF300307);

  /// A very dark danger color.
  static const Color VALUE_800 = Color(0xFF5F070E);

  /// A dark danger color.
  static const Color VALUE_700 = Color(0xFF8F0A16);

  /// A moderately dark danger color.
  static const Color VALUE_600 = Color(0xFFBE0E1D);

  /// The primary danger color.
  static const Color VALUE_500 = Color(0xFFEE1124);

  /// A moderately light danger color.
  static const Color VALUE_400 = Color(0xFFF14150);

  /// A light danger color.
  static const Color VALUE_300 = Color(0xFFF5707C);

  /// A very light danger color.
  static const Color VALUE_200 = Color(0xFFF8A0A7);

  /// An extremely light danger color.
  static const Color VALUE_100 = Color(0xFFFCCFD3);

  /// The lightest danger color.
  static const Color VALUE_50 = Color(0xFFFDE7E9);
}
