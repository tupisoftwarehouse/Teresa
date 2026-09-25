import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/internals/factories/device_language_string_manager_factory.dart";

void main() {
  group("Test \"DeviceLanguageStringManagerFactory\" Class", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    test("Test If Method \"getInstance\" Returns An Instance And Sets Device Language Change Observer", () {
      final instance = DeviceLanguageStringManagerFactory.getInstance(
        DEVICE_LANGUAGE_STRING_DATA,
      );

      expect(instance.deviceLanguageStrings.value, isA<String>());
    });
  });
}
