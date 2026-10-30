import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/internals/concerns/theme_selector.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/concrete/concrete_dark_teresa_theme_value_object.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/concrete/concrete_light_teresa_theme_value_object.dart";

void main() {
  group("ThemeSelector", () {
    group("getSelectedTheme", () {
      test("should return selected theme based on current device theme", () {
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
  });
}
