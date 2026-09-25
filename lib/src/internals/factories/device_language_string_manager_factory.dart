import "package:flutter/widgets.dart";
import "package:teresa/src/internals/checker/teresa_checker.dart";
import "package:teresa/src/internals/concerns/device_language_string_selector.dart";
import "package:teresa/src/internals/managers/device_language_string_manager.dart";
import "package:teresa/src/device_language_string_data/device_language_string_data.dart";
import "package:teresa/src/internals/widgets_binding_observers/device_language_strings_widgets_binding_observer.dart";

class DeviceLanguageStringManagerFactory {
  static DeviceLanguageStringManager? _instance;

  DeviceLanguageStringManagerFactory._();

  static DeviceLanguageStringManager<T> getInstance<T>(
    DeviceLanguageStringData<T> deviceLanguageStringData,
  ) {
    if (isObjectNotInitialized(_instance)) {
      final initialDeviceLanguageString =
          CurrentDeviceLanguageStringSelector.getCurrentDeviceLanguageStrings<
            T
          >(
            deviceLanguageStringData,
            WidgetsBinding.instance.platformDispatcher.locale.languageCode,
          );

      _instance = DeviceLanguageStringManager<T>(initialDeviceLanguageString, (
        deviceLanguageStringsViewModel,
      ) {
        final deviceLanguageStringsWidgetsBindingObserver =
            DeviceLanguageStringsWidgetsBindingObserver(
              deviceLanguageStringData,
              deviceLanguageStringsViewModel,
            );

        WidgetsBinding.instance.addObserver(
          deviceLanguageStringsWidgetsBindingObserver,
        );
      });
    }

    return _instance as DeviceLanguageStringManager<T>;
  }
}
