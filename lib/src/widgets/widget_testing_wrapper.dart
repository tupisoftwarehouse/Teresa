import "package:flutter/material.dart" as material;
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

/// Provides a standardized Flutter environment for widget testing.
///
/// [WidgetTestingWrapper] wraps [child] in a [material.MaterialApp] and
/// [material.Scaffold], while optionally providing custom [MediaQueryData] and
/// device language strings.
///
/// This allows widgets that depend on application-level Flutter context,
/// screen metrics, [TeresaTheme], or [DeviceLanguageStrings] to be rendered in a consistent
/// testing environment.
///
/// The generic type [T] represents the type of the device language strings
/// provided to the widget tree.
///
/// Example:
///
/// ```dart
/// WidgetTestingWrapper<MyStrings>(
///   mediaQueryData: const MediaQueryData(
///     size: Size(375, 812),
///   ),
///   theme: ...,
///   deviceLanguageStrings: ...,
///   child: const MyWidget(),
/// );
/// ```
class WidgetTestingWrapper<T> extends StatelessWidget {
  /// Optional media query configuration provided to the widget tree.
  final MediaQueryData? mediaQueryData;

  /// Optional theme provided to descendant widgets.
  final AbstractTeresaThemeValueObject? theme;

  /// Optional device language strings provided to descendant widgets.
  final T? deviceLanguageStrings;

  /// The widget rendered inside the testing application.
  final Widget child;

  /// Creates a widget testing wrapper with optional theme, media query data and
  /// device language strings.
  const WidgetTestingWrapper({
    super.key,
    this.mediaQueryData,
    this.theme,
    this.deviceLanguageStrings,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var configuredTestingWidget =
        material.MaterialApp(home: material.Scaffold(body: child)) as Widget;

    if (isMediaQueryDataSpecified(mediaQueryData)) {
      configuredTestingWidget = MediaQuery(
        data: mediaQueryData!,
        child: configuredTestingWidget,
      );
    }

    if (isThemeSpecified(theme)) {
      configuredTestingWidget =
          teresa_theme_manager_inherited_widget.TeresaThemeManager(
            teresaThemeManager: TeresaThemeManager(theme!, (_) {}),
            child: TeresaTheme(theme: theme!, child: configuredTestingWidget),
          );
    }

    if (isDeviceLanguageStringSpecified(deviceLanguageStrings)) {
      configuredTestingWidget =
          device_language_string_manager_inherited_widget.DeviceLanguageStringManager<
            T
          >(
            deviceLanguageStringManager: DeviceLanguageStringManager<T>(
              deviceLanguageStrings as T,
              (_) {},
            ),
            child: DeviceLanguageStrings<T>(
              deviceLanguageStrings: deviceLanguageStrings as T,
              child: configuredTestingWidget,
            ),
          );
    }

    return configuredTestingWidget;
  }
}
