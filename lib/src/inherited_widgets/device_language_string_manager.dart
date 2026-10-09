import "package:flutter/widgets.dart";
import "package:teresa/src/internals/checker/teresa_checker.dart";
import "package:teresa/src/internals/managers/device_language_string_manager.dart"
    as device_language_string_manager_implementation;

class DeviceLanguageStringManager<T> extends InheritedWidget {
  final device_language_string_manager_implementation.DeviceLanguageStringManager<
    T
  >
  deviceLanguageStringManager;

  const DeviceLanguageStringManager({
    super.key,
    required this.deviceLanguageStringManager,
    required super.child,
  });

  static device_language_string_manager_implementation.DeviceLanguageStringManager<
    T
  >
  of<T>(BuildContext context) {
    final currentWidget = context
        .dependOnInheritedWidgetOfExactType<DeviceLanguageStringManager<T>>();

    return currentWidget!.deviceLanguageStringManager;
  }

  @override
  bool updateShouldNotify(DeviceLanguageStringManager<T> oldWidget) {
    return isDeviceLanguageStringsUpdated(
      deviceLanguageStringManager.deviceLanguageStrings.value,
      oldWidget.deviceLanguageStringManager.deviceLanguageStrings.value,
    );
  }
}
