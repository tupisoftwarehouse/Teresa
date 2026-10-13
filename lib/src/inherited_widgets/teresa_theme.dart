import "package:flutter/widgets.dart";
import "package:teresa/src/internals/checker/teresa_checker.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/concrete/concrete_light_teresa_theme_value_object.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/abstract/abstract_teresa_theme_value_object.dart";

/// Provides the current [AbstractTeresaThemeValueObject] to descendant widgets
/// through the Flutter widget tree.
///
/// Use [of] to retrieve the active theme from a [BuildContext]. If no
/// [TeresaTheme] is found in the widget tree, [of] falls back to
/// [ConcreteLightTeresaThemeValueObject].
///
/// The widget automatically notifies dependent widgets when Teresa determines
/// that the theme has changed.
///
/// Example:
///
/// ```dart
/// final theme = TeresaTheme.of(context);
///
/// return Container(
///   color: theme.colors.background,
/// );
/// ```
class TeresaTheme extends InheritedWidget {
  /// The theme value object provided to descendant widgets.
  final AbstractTeresaThemeValueObject theme;

  /// Creates an inherited widget that provides a Teresa theme to its
  /// descendants.
  const TeresaTheme({super.key, required this.theme, required super.child});

  /// Retrieves the current Teresa theme from the widget tree.
  ///
  /// Returns [ConcreteLightTeresaThemeValueObject] when no [TeresaTheme]
  /// ancestor is found in the widget tree.
  static AbstractTeresaThemeValueObject of(BuildContext context) {
    final currentWidget = context
        .dependOnInheritedWidgetOfExactType<TeresaTheme>();

    return currentWidget?.theme ?? ConcreteLightTeresaThemeValueObject();
  }

  @override
  bool updateShouldNotify(TeresaTheme oldWidget) {
    return isThemeUpdated(theme, oldWidget.theme);
  }
}
