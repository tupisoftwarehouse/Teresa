import "package:flutter/material.dart" as material;
import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:teresa/src/inherited_widgets/device_language_strings.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/internals/checker/teresa_checker.dart";
import "package:teresa/src/internals/managers/teresa_theme_manager.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/abstract/abstract_teresa_theme_value_object.dart";
import "package:teresa/src/inherited_widgets/device_language_string_manager.dart"
    as device_language_string_manager_inherited_widget;
import "package:teresa/src/inherited_widgets/teresa_theme_manager.dart"
    as teresa_theme_manager_inherited_widget;
import "package:teresa/src/internals/managers/device_language_string_manager.dart";

/// Provides a standardized Flutter environment for widget preview.
///
/// [WidgetPreviewingWrapper] wraps [child] in a [material.MaterialApp] and
/// [material.Scaffold], while optionally providing custom
/// device language strings.
///
/// This allows widgets that depend on application-level Flutter context,
/// screen metrics, [TeresaTheme], or [DeviceLanguageStrings] to be rendered in a consistent
/// preview environment.
///
/// The generic type [T] represents the type of the device language strings
/// provided to the widget tree.
///
/// Example:
///
/// ```dart
/// WidgetPreviewingWrapper<MyStrings>(
///   theme: ...,
///   deviceLanguageStrings: ...,
///   child: const MyWidget(),
/// );
/// ```
class WidgetPreviewingWrapper<T> extends StatelessWidget {
  /// Optional theme provided to descendant widgets.
  final AbstractTeresaThemeValueObject? theme;

  /// Optional device language strings provided to descendant widgets.
  final T? deviceLanguageStrings;

  /// The widget rendered inside the preview application.
  final Widget child;

  /// Creates a widget preview wrapper with optional theme and
  /// device language strings.
  const WidgetPreviewingWrapper({
    super.key,
    this.theme,
    this.deviceLanguageStrings,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var configuredPreviewingWidget = child;

    if (isDeviceLanguageStringSpecified(deviceLanguageStrings)) {
      configuredPreviewingWidget =
          device_language_string_manager_inherited_widget.DeviceLanguageStringManager<
            T
          >(
            deviceLanguageStringManager: DeviceLanguageStringManager<T>(
              deviceLanguageStrings as T,
              (_) {},
            ),
            child: DeviceLanguageStrings<T>(
              deviceLanguageStrings: deviceLanguageStrings as T,
              child: configuredPreviewingWidget,
            ),
          );
    }

    if (isThemeSpecified(theme)) {
      configuredPreviewingWidget =
          teresa_theme_manager_inherited_widget.TeresaThemeManager(
            teresaThemeManager: TeresaThemeManager(theme!, (_) {}),
            child: TeresaTheme(
              theme: theme!,
              child: configuredPreviewingWidget,
            ),
          );
    }

    return Builder(
      builder: (configuredPreviewingWidgetContext) {
        final teresaTheme = TeresaTheme.of(configuredPreviewingWidgetContext);

        return material.MaterialApp(
          debugShowCheckedModeBanner: false,
          themeAnimationCurve: Curves.easeInOutCirc,
          themeAnimationStyle: AnimationStyle(
            curve: Curves.easeInOutCirc,
            reverseCurve: Curves.easeInOutCirc,
          ),
          home: material.Scaffold(
            backgroundColor: teresaTheme.surface.backgroundColor,
            body: LayoutBuilder(
              builder: (_, constraints) {
                return Container(
                  padding: EdgeInsets.all(16),
                  height: constraints.maxHeight,
                  width: constraints.maxWidth - 80,
                  child: Center(child: configuredPreviewingWidget),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

@Preview()
Widget preview() {
  return WidgetPreviewingWrapper(child: Placeholder());
}
