import "package:teresa/src/internals/concerns/device_language_string_selector.dart";
import "package:teresa/src/internals/managers/device_language_string_manager.dart";
import "package:teresa/src/device_language_string_data/device_language_string_data.dart";

class ApplicationDeviceLanguageStringsSynchronizingTransactionScript {
  ApplicationDeviceLanguageStringsSynchronizingTransactionScript._();

  static void synchronizeApplicationDeviceLanguageStrings<T>(
    String currentDeviceLanguageCode,
    DeviceLanguageStringData<T> deviceLanguageStringData,
    DeviceLanguageStringManager<T> deviceLanguageStringsManager,
  ) {
    final currentDeviceLanguage =
        CurrentDeviceLanguageStringSelector.getCurrentDeviceLanguageStrings(
          deviceLanguageStringData,
          currentDeviceLanguageCode,
        );

    deviceLanguageStringsManager.deviceLanguageStrings.value =
        currentDeviceLanguage;
  }
}
