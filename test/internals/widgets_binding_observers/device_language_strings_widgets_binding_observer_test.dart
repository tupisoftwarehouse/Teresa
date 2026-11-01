import "dart:ui";

import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/internals/managers/device_language_string_manager.dart";
import "package:teresa/src/internals/widgets_binding_observers/device_language_strings_widgets_binding_observer.dart";

void main() {
  group("DeviceLanguageStringsWidgetsBindingObserver", () {
    late DeviceLanguageStringsWidgetsBindingObserver
    deviceLanguageStringsWidgetsBindingObserver;
    late DeviceLanguageStringManager deviceLanguageStringsManager;

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    setUp(() {
      deviceLanguageStringsManager = DeviceLanguageStringManager(
        CONCRETE_FRENCH_APPLICATION_LANGUAGE,
        (_) {},
      );

      deviceLanguageStringsWidgetsBindingObserver =
          DeviceLanguageStringsWidgetsBindingObserver(
            DEVICE_LANGUAGE_STRING_DATA,
            deviceLanguageStringsManager,
          );
    });

    group("didChangeAppLifecycleState", () {
      test("should update device language strings in the manager and statusbar content color when the application resumes", () {
        deviceLanguageStringsWidgetsBindingObserver.didChangeAppLifecycleState(
          AppLifecycleState.resumed,
        );

        expect(
          deviceLanguageStringsManager.deviceLanguageStrings.value,
          CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
        );
      });
    });

    group("didChangeLocales", () {
      test("should update device language strings in the manager when the device language changes", () {
        deviceLanguageStringsWidgetsBindingObserver.didChangeLocales(null);

        expect(
          deviceLanguageStringsManager.deviceLanguageStrings.value,
          CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
        );
      });
    });
  });
}
