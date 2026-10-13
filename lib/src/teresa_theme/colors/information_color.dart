import "package:flutter/widgets.dart";

/// Defines the information color palette used throughout Teresa.
///
/// Each static property exposes its corresponding [Color].
///
/// The palette ranges from [VALUE_900], the darkest value, to [VALUE_50],
/// the lightest value.
class InformationColor {
  InformationColor._();

  /// The darkest information color.
  static const Color VALUE_900 = Color(0xFF001A33);

  /// A very dark information color.
  static const Color VALUE_800 = Color(0xFF003466);

  /// A dark information color.
  static const Color VALUE_700 = Color(0xFF004E99);

  /// A moderately dark information color.
  static const Color VALUE_600 = Color(0xFF0067CC);

  /// The primary information color.
  static const Color VALUE_500 = Color(0xFF0081FF);

  /// A moderately light information color.
  static const Color VALUE_400 = Color(0xFF339AFF);

  /// A light information color.
  static const Color VALUE_300 = Color(0xFF66B4FF);

  /// A very light information color.
  static const Color VALUE_200 = Color(0xFF99CDFF);

  /// An extremely light information color.
  static const Color VALUE_100 = Color(0xFFCCE6FF);

  /// The lightest information color.
  static const Color VALUE_50 = Color(0xFFE6F2FF);
}
