import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/internals/managers/device_language_string_manager.dart";

void main() {
  group("DeviceLanguageStringsManager", () {
    late DeviceLanguageStringManager deviceLanguageStringsManager;

    test("should initialize its states with initial application language and set device language strings change observer", () {
      var isDeviceLanguageStringsChangeObserverSet = false;

      deviceLanguageStringsManager = DeviceLanguageStringManager(
        CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
        (_) {
          isDeviceLanguageStringsChangeObserverSet = true;
        },
      );

      expect(
        deviceLanguageStringsManager.deviceLanguageStrings.value,
        CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
      );
      expect(isDeviceLanguageStringsChangeObserverSet, true);
    });
  });
}
