import "package:flutter/material.dart" as material;
import "package:flutter/widgets.dart";
import "package:teresa/src/inherited_widgets/device_language_strings.dart";
import "package:teresa/src/internals/checker/teresa_checker.dart";

/// Provides a standardized Flutter environment for widget testing.
///
/// [WidgetTestingWrapper] wraps [child] in a [material.MaterialApp] and
/// [material.Scaffold], while optionally providing custom [MediaQueryData] and
/// device language strings.
///
/// This allows widgets that depend on application-level Flutter context,
/// screen metrics, or [DeviceLanguageStrings] to be rendered in a consistent
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
///   deviceLanguageStrings: strings,
///   child: const MyWidget(),
/// );
/// ```
class WidgetTestingWrapper<T> extends StatelessWidget {
  /// Optional media query configuration provided to the widget tree.
  final MediaQueryData? mediaQueryData;

  /// Optional device language strings provided to descendant widgets.
  final T? deviceLanguageStrings;

  /// The widget rendered inside the testing application scaffold.
  final Widget child;

  /// Creates a widget testing wrapper with optional media query data and
  /// device language strings.
  const WidgetTestingWrapper({
    super.key,
    this.mediaQueryData,
    this.deviceLanguageStrings,
    required this.child,
  });

  @override
  Widget build(BuildContext _) {
    final widgetToBeRendered = material.MaterialApp(
      home: material.Scaffold(body: child),
    );

    if (isMediaQueryDataSpecified(mediaQueryData) &&
        isDeviceLanguageStringsSpecified(deviceLanguageStrings)) {
      return MediaQuery(
        data: mediaQueryData!,
        child: DeviceLanguageStrings(
          deviceLanguageStrings: deviceLanguageStrings,
          child: widgetToBeRendered,
        ),
      );
    } else if (isMediaQueryDataSpecified(mediaQueryData)) {
      return MediaQuery(data: mediaQueryData!, child: widgetToBeRendered);
    } else {
      return widgetToBeRendered;
    }
  }
}
