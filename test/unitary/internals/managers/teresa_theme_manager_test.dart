import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/internals/managers/teresa_theme_manager.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/concrete/concrete_light_teresa_theme_value_object.dart";

void main() {
  group("TeresaThemeManager", () {
    late TeresaThemeManager themeManager;

    test("should initialize its states with initial device theme and set device theme change observer", () {
      bool isDeviceThemeChangeObserverSet = false;

      themeManager = TeresaThemeManager(TERESA_THEME, (_) {
        isDeviceThemeChangeObserverSet = true;
      });

      expect(
        themeManager.theme.value,
        isA<ConcreteLightTeresaThemeValueObject>(),
      );
      expect(isDeviceThemeChangeObserverSet, true);
    });
  });
}
