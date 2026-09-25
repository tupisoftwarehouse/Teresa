import "dart:ui";

import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/internals/managers/device_language_string_manager.dart";
import "package:teresa/src/internals/widgets_binding_observers/device_language_strings_widgets_binding_observer.dart";

void main() {
  group("Test \"DeviceLanguageStringsWidgetsBindingObserver\" Class", () {
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

    test("Test If Method \"didChangeAppLifecycleState\" Updates Device Language Strings In The Manager And Statusbar Content Color On Resumed as Application Lifecycle State", () {
      deviceLanguageStringsWidgetsBindingObserver.didChangeAppLifecycleState(
        AppLifecycleState.resumed,
      );

      expect(
        deviceLanguageStringsManager.deviceLanguageStrings.value,
        CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
      );
    });

    test("Test If Method \"didChangeLocales\" Updates Device Language Strings In The Manager On Device Language Change", () {
      deviceLanguageStringsWidgetsBindingObserver.didChangeLocales(null);

      expect(
        deviceLanguageStringsManager.deviceLanguageStrings.value,
        CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
      );
    });
  });
}
