import "package:teresa/src/teresa_theme/teresa_theme_value_object/abstract/abstract_teresa_theme_value_object.dart";

/// Contains the theme value objects used by Teresa for light and dark themes.
///
/// [lightThemeValueObject] defines the theme configuration used for light
/// appearance.
///
/// [darkThemeValueObject] defines the theme configuration used for dark
/// appearance.
///
/// [TeresaThemeData] is provided to [TeresaApplication] to initialize the
/// application's theme management.
///
/// Example:
///
/// ```dart
/// final themeData = TeresaThemeData(
///   lightThemeValueObject: ConcreteLightTeresaThemeValueObject(),
///   darkThemeValueObject: ConcreteDarkTeresaThemeValueObject(),
/// );
/// ```
class TeresaThemeData {
  /// The theme value object used for the light appearance.
  final AbstractTeresaThemeValueObject lightThemeValueObject;

  /// The theme value object used for the dark appearance.
  final AbstractTeresaThemeValueObject darkThemeValueObject;

  /// Creates theme data containing the value objects for both light and dark
  /// appearances.
  TeresaThemeData({
    required this.lightThemeValueObject,
    required this.darkThemeValueObject,
  });
}
