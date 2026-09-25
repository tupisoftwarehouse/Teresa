import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/platform_constants.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/internals/concerns/device_language_string_selector.dart";

void main() {
  group("Test \"CurrentDeviceLanguageStringSelector\" Class", () {
    test("Test If Method \"getCurrentDeviceLanguageStrings\" Returns Selected Language Strings Based On Current Device Language Code", () {
      final englishLanguageStrings =
          CurrentDeviceLanguageStringSelector.getCurrentDeviceLanguageStrings(
            DEVICE_LANGUAGE_STRING_DATA,
            ENGLISH_LANGUAGE_CODE,
          );
      final portugueseLanguageStrings =
          CurrentDeviceLanguageStringSelector.getCurrentDeviceLanguageStrings(
            DEVICE_LANGUAGE_STRING_DATA,
            PORTUGUESE_LANGUAGE_CODE,
          );
      final frenchLanguageStrings =
          CurrentDeviceLanguageStringSelector.getCurrentDeviceLanguageStrings(
            DEVICE_LANGUAGE_STRING_DATA,
            FRENCH_LANGUAGE_CODE,
          );
      final germanLanguageStrings =
          CurrentDeviceLanguageStringSelector.getCurrentDeviceLanguageStrings(
            DEVICE_LANGUAGE_STRING_DATA,
            GERMAN_LANGUAGE_CODE,
          );
      final italianLanguageStrings =
          CurrentDeviceLanguageStringSelector.getCurrentDeviceLanguageStrings(
            DEVICE_LANGUAGE_STRING_DATA,
            ITALIAN_LANGUAGE_CODE,
          );
      final spanishLanguageStrings =
          CurrentDeviceLanguageStringSelector.getCurrentDeviceLanguageStrings(
            DEVICE_LANGUAGE_STRING_DATA,
            SPANISH_LANGUAGE_CODE,
          );

      expect(englishLanguageStrings, CONCRETE_ENGLISH_APPLICATION_LANGUAGE);
      expect(
        portugueseLanguageStrings,
        CONCRETE_PORTUGUESE_APPLICATION_LANGUAGE,
      );
      expect(frenchLanguageStrings, CONCRETE_FRENCH_APPLICATION_LANGUAGE);
      expect(germanLanguageStrings, CONCRETE_GERMAN_APPLICATION_LANGUAGE);
      expect(italianLanguageStrings, CONCRETE_ITALIAN_APPLICATION_LANGUAGE);
      expect(spanishLanguageStrings, CONCRETE_SPANISH_APPLICATION_LANGUAGE);
    });
  });
}
