import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/internals/managers/device_language_string_manager.dart";

void main() {
  group("Test \"DeviceLanguageStringsManager\" Class", () {
    late DeviceLanguageStringManager deviceLanguageStringsManager;

    test("Test If Manager Initializes Its States With Initial Application Language And Sets Device Language Strings Change Observer", () {
      bool isDeviceLanguageStringsChangeObserverSet = false;

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
