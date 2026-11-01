import "package:flutter/widgets.dart";

/// Defines the neutral color palette used throughout Teresa.
///
/// Each static property exposes its corresponding [Color].
///
/// The palette ranges from [VALUE_1000], the darkest value, through the
/// intermediate neutral values to [VALUE_0], the lightest value.
class NeutralColor {
  NeutralColor._();

  /// The darkest neutral color.
  static const Color VALUE_1000 = Color(0xFF000000);

  /// A very dark neutral color.
  static const Color VALUE_900 = Color(0xFF0D0D0C);

  /// A dark neutral color.
  static const Color VALUE_800 = Color(0xFF282724);

  /// A moderately dark neutral color.
  static const Color VALUE_700 = Color(0xFF43413D);

  /// A medium-dark neutral color.
  static const Color VALUE_600 = Color(0xFF5E5B55);

  /// The middle neutral color.
  static const Color VALUE_500 = Color(0xFF78746D);

  /// A medium-light neutral color.
  static const Color VALUE_400 = Color(0xFF928E86);

  /// A light neutral color.
  static const Color VALUE_300 = Color(0xFFAAA7A1);

  /// A very light neutral color.
  static const Color VALUE_200 = Color(0xFFC2C0BC);

  /// An extremely light neutral color.
  static const Color VALUE_100 = Color(0xFFDBD9D7);

  /// A near-white neutral color.
  static const Color VALUE_50 = Color(0xFFF3F2F2);

  /// The lightest neutral color.
  static const Color VALUE_0 = Color(0xFFFFFFFF);

  /// A fully transparent color.
  static const Color TRANSPARENT = Color(0x00FFFFFF);
}
