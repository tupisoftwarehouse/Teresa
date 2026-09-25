import "package:flutter/widgets.dart";

class DeviceLanguageStringManager<T> {
  final ValueNotifier<T> deviceLanguageStrings;

  DeviceLanguageStringManager(
    T initialDeviceLanguageStrings,
    void Function(DeviceLanguageStringManager deviceLanguageStringManager)
    setDeviceLanguageStringsChangeObserver,
  ) : deviceLanguageStrings = ValueNotifier<T>(initialDeviceLanguageStrings) {
    setDeviceLanguageStringsChangeObserver(this);
  }
}
