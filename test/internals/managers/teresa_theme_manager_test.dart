import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/internals/managers/teresa_theme_manager.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/concrete/concrete_light_teresa_theme_value_object.dart";

void main() {
  group("Test \"TeresaThemeManager\" Class", () {
    late TeresaThemeManager themeManager;

    test("Test If Manager Initializes Its States With Initial Device Theme And Sets Device Theme Change Observer", () {
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
