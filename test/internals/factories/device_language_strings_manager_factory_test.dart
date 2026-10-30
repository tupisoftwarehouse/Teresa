import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/internals/factories/device_language_string_manager_factory.dart";

void main() {
  group("DeviceLanguageStringManagerFactory", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    group("getInstance", () {
      test(
        "should return an instance and set device language change observer",
        () {
          final instance = DeviceLanguageStringManagerFactory.getInstance(
            DEVICE_LANGUAGE_STRING_DATA,
          );

          expect(instance.deviceLanguageStrings.value, isA<String>());
        },
      );
    });
  });
}
