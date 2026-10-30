import "package:flutter/widgets.dart" hide Orientation;
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/internals/checker/teresa_checker.dart";
import "package:teresa/src/orientation/orientation.dart";

void main() {
  group("TeresaChecker", () {
    group("isOrientationHorizontal", () {
      test("should return true when orientation is horizontal", () {
        final orientationIsHorizontal = isOrientationHorizontal(
          Orientation.HORIZONTAL,
        );
        final orientationIsNotHorizontal = isOrientationHorizontal(
          Orientation.VERTICAL,
        );

        expect(orientationIsHorizontal, true);
        expect(orientationIsNotHorizontal, false);
      });
    });

    group("isThemeUpdated", () {
      test("should return true when theme is updated", () {
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
      });
    });

    group("isDeviceLanguageStringsUpdated", () {
      test("should return true when device language strings is updated", () {
        final deviceLanguageStringsIsUpdated = isDeviceLanguageStringsUpdated(
          CONCRETE_FRENCH_APPLICATION_LANGUAGE,
          CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
        );
        final deviceLanguageStringsIsNotUpdated =
            isDeviceLanguageStringsUpdated(
              CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
              CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
            );

        expect(deviceLanguageStringsIsUpdated, true);
        expect(deviceLanguageStringsIsNotUpdated, false);
      });
    });

    group("isApplicationResumed", () {
      test("should return true when application is resumed", () {
        final applicationIsResumed = isApplicationResumed(
          AppLifecycleState.resumed,
        );
        final applicationIsNotResumed = isApplicationResumed(
          AppLifecycleState.paused,
        );

        expect(applicationIsResumed, true);
        expect(applicationIsNotResumed, false);
      });
    });

    group("isMediaQueryDataSpecified", () {
      test("should return true when media query data is specified", () {
        final mediaQueryDataIsSpecified = isMediaQueryDataSpecified(
          MEDIA_QUERY_DATA,
        );
        final mediaQueryDataIsNotSpecified = isMediaQueryDataSpecified(null);

        expect(mediaQueryDataIsSpecified, true);
        expect(mediaQueryDataIsNotSpecified, false);
      });
    });

    group("isDeviceLanguageStringSpecified", () {
      test("should return true when device language string is specified", () {
        final deviceLanguageStringIsSpecified = isDeviceLanguageStringSpecified(
          MEDIA_QUERY_DATA,
        );
        final deviceLanguageStringIsNotSpecified =
            isDeviceLanguageStringSpecified(null);

        expect(deviceLanguageStringIsSpecified, true);
        expect(deviceLanguageStringIsNotSpecified, false);
      });
    });

    group("isThemeSpecified", () {
      test("should return true when theme is specified", () {
        final themeIsSpecified = isThemeSpecified(TERESA_THEME);
        final themeIsNotSpecified = isThemeSpecified(null);

        expect(themeIsSpecified, true);
        expect(themeIsNotSpecified, false);
      });
    });
  });
}
