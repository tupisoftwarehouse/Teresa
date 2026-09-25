import "package:flutter/widgets.dart" hide Orientation;
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/internals/checker/teresa_checker.dart";
import "package:teresa/src/orientation/orientation.dart";

void main() {
  group("Test \"TeresaChecker\" Module", () {
    test("Test If Function \"isOrientationHorizontal\" Returns True If Orientation Is Horizontal", () {
      final orientationIsHorizontal = isOrientationHorizontal(
        Orientation.HORIZONTAL,
      );
      final orientationIsNotHorizontal = isOrientationHorizontal(
        Orientation.VERTICAL,
      );

      expect(orientationIsHorizontal, true);
      expect(orientationIsNotHorizontal, false);
    });

    test("Test If Function \"isIsObjectNotInitialized\" Returns True If Object Is Not Initialized", () {
      final objectIsNotInitialized = isObjectNotInitialized(null);
      final objectIsInitialized = isObjectNotInitialized(INITIALIZED_OBJECT);

      expect(objectIsNotInitialized, true);
      expect(objectIsInitialized, false);
    });

    test(
      "Test If Function \"isThemeUpdated\" Returns True If Theme Is Updated",
      () {
        final themeIsUpdated = isThemeUpdated(
          TERESA_THEME_DATA.lightThemeValueObject,
          TERESA_THEME_DATA.darkThemeValueObject,
        );
        final themeIsNotUpdated = isThemeUpdated(
          TERESA_THEME_DATA.lightThemeValueObject,
          TERESA_THEME_DATA.lightThemeValueObject,
        );

        expect(themeIsUpdated, true);
        expect(themeIsNotUpdated, false);
      },
    );

    test("Test If Function \"isDeviceLanguageStringsUpdated\" Returns True If Device Language Strings Is Updated", () {
      final deviceLanguageStringsIsUpdated = isDeviceLanguageStringsUpdated(
        CONCRETE_FRENCH_APPLICATION_LANGUAGE,
        CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
      );
      final deviceLanguageStringsIsNotUpdated = isDeviceLanguageStringsUpdated(
        CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
        CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
      );

      expect(deviceLanguageStringsIsUpdated, true);
      expect(deviceLanguageStringsIsNotUpdated, false);
    });

    test("Test If Function \"isApplicationResumed\" Returns True If Application Is Resumed", () {
      final applicationIsResumed = isApplicationResumed(
        AppLifecycleState.resumed,
      );
      final applicationIsNotResumed = isApplicationResumed(
        AppLifecycleState.paused,
      );

      expect(applicationIsResumed, true);
      expect(applicationIsNotResumed, false);
    });

    test("Test If Function \"isMediaQueryDataSpecified\" Returns True If Media Query Data Is Specified", () {
      final mediaQueryDataIsSpecified = isMediaQueryDataSpecified(
        MEDIA_QUERY_DATA,
      );
      final mediaQueryDataIsNotSpecified = isMediaQueryDataSpecified(null);

      expect(mediaQueryDataIsSpecified, true);
      expect(mediaQueryDataIsNotSpecified, false);
    });

    test("Test If Function \"isDeviceLanguageStringsSpecified\" Returns True If Device Language Strings Is Specified", () {
      final deviceLanguageStringsIsSpecified = isDeviceLanguageStringsSpecified(
        MEDIA_QUERY_DATA,
      );
      final deviceLanguageStringsIsNotSpecified =
          isDeviceLanguageStringsSpecified(null);

      expect(deviceLanguageStringsIsSpecified, true);
      expect(deviceLanguageStringsIsNotSpecified, false);
    });
  });
}
