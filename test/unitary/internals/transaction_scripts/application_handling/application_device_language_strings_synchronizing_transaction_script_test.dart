import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/internals/managers/device_language_string_manager.dart";
import "package:teresa/src/internals/transaction_scripts/application_handling/application_device_language_strings_synchronizing_transaction_script.dart";

void main() {
  group("ApplicationDeviceLanguageStringsSynchronizingTransactionScript", () {
    late DeviceLanguageStringManager deviceLanguageStringsManager;

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();

      deviceLanguageStringsManager = DeviceLanguageStringManager(
        CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
        (_) {},
      );
    });

    group("synchronizeApplicationDeviceLanguageStrings", () {
      test("should update devicelanguagestrings in the manager and statusbar content color", () {
        ApplicationDeviceLanguageStringsSynchronizingTransactionScript.synchronizeApplicationDeviceLanguageStrings(
          ENGLISH_LANGUAGE_CODE,
          DEVICE_LANGUAGE_STRING_DATA,
          deviceLanguageStringsManager,
        );

        expect(
          deviceLanguageStringsManager.deviceLanguageStrings.value,
          CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
        );
      });
    });
  });
}
