import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/platform_constants.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/internals/factories/device_language_string_manager_factory.dart";
import "package:teresa/src/internals/managers/device_language_string_manager.dart";
import "package:teresa/src/internals/transaction_scripts/application_handling/application_device_language_strings_synchronizing_transaction_script.dart";

void main() {
  group("Test \"ApplicationDeviceLanguageStringsSynchronizingTransactionScript\" Class", () {
    late DeviceLanguageStringManager deviceLanguageStringsManager;

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();

      deviceLanguageStringsManager =
          DeviceLanguageStringManagerFactory.getInstance(
            DEVICE_LANGUAGE_STRING_DATA,
          );
    });

    test("Test If Method \"synchronizeApplicationDeviceLanguageStrings\" Updates DeviceLanguageStrings In The Manager And Statusbar Content Color", () {
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
}
