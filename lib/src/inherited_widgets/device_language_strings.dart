import "package:flutter/widgets.dart";
import "package:teresa/src/internals/checker/teresa_checker.dart";

/// Provides device-language-specific data to descendant widgets through the
/// Flutter widget tree.
///
/// [deviceLanguageStrings] contains the language data made available to
/// descendants. The generic type [T] allows the inherited widget to expose
/// different kinds of language string collections.
///
/// Use [of] to retrieve the current language data from a [BuildContext].
/// The widget automatically notifies dependent widgets when the language data
/// changes according to Teresa's language-string update rules.
///
/// Example:
///
/// ```dart
/// final strings = DeviceLanguageStrings.of<MyStrings>(context);
///
/// return Text(strings.welcome);
/// ```
class DeviceLanguageStrings<T> extends InheritedWidget {
  /// The device-language-specific data exposed to descendant widgets.
  final T deviceLanguageStrings;

  /// Creates an inherited widget that provides device language strings to
  /// its descendants.
  const DeviceLanguageStrings({
    super.key,
    required this.deviceLanguageStrings,
    required super.child,
  });

  /// Retrieves the current device language strings from the widget tree.
  ///
  /// The returned value has the same type as the [DeviceLanguageStrings]
  /// instance found in the widget tree.
  static T of<T>(BuildContext context) {
    final currentWidget = context
        .dependOnInheritedWidgetOfExactType<DeviceLanguageStrings<T>>()!;

    return currentWidget.deviceLanguageStrings;
  }

  @override
  bool updateShouldNotify(DeviceLanguageStrings oldWidget) {
    return isDeviceLanguageStringsUpdated(
      deviceLanguageStrings,
      oldWidget.deviceLanguageStrings,
    );
  }
}
