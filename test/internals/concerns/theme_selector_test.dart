import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/internals/concerns/theme_selector.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/concrete/concrete_dark_teresa_theme_value_object.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/concrete/concrete_light_teresa_theme_value_object.dart";

void main() {
  group("Test \"ThemeSelector\" Class", () {
    test("Test If Method \"getSelectedTheme\" Returns Selected Theme Based On Current Device Theme", () {
      final lightTheme = ThemeSelector.getSelectedTheme(
        TERESA_THEME_DATA,
        Brightness.light,
      );
      final darkTheme = ThemeSelector.getSelectedTheme(
        TERESA_THEME_DATA,
        Brightness.dark,
      );

      expect(lightTheme, isA<ConcreteLightTeresaThemeValueObject>());
      expect(darkTheme, isA<ConcreteDarkTeresaThemeValueObject>());
    });
  });
}
