import "package:flutter/widgets.dart";

/// Defines the secondary color palette used throughout Teresa.
///
/// Each static property exposes its corresponding [Color].
///
/// The palette ranges from [VALUE_900], the darkest value, to [VALUE_50],
/// the lightest value.
class SecondaryColor {
  SecondaryColor._();

  /// The darkest secondary color.
  static const Color VALUE_900 = Color(0xFF023122);

  /// A very dark secondary color.
  static const Color VALUE_800 = Color(0xFF036344);

  /// A dark secondary color.
  static const Color VALUE_700 = Color(0xFF059466);

  /// A moderately dark secondary color.
  static const Color VALUE_600 = Color(0xFF06C688);

  /// The primary secondary color.
  static const Color VALUE_500 = Color(0xFF08F7AA);

  /// A moderately light secondary color.
  static const Color VALUE_400 = Color(0xFF39F9BB);

  /// A light secondary color.
  static const Color VALUE_300 = Color(0xFF6BFACC);

  /// A very light secondary color.
  static const Color VALUE_200 = Color(0xFF9CFCDD);

  /// An extremely light secondary color.
  static const Color VALUE_100 = Color(0xFFCEFDEE);

  /// The lightest secondary color.
  static const Color VALUE_50 = Color(0xFFE6FEF7);
}
