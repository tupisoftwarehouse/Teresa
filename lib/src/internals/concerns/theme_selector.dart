import "package:flutter/widgets.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/abstract/abstract_teresa_theme_value_object.dart";
import "package:teresa/src/teresa_theme_data/teresa_theme_data.dart";

class ThemeSelector {
  ThemeSelector._();

  static AbstractTeresaThemeValueObject getSelectedTheme(
    TeresaThemeData themeData,
    Brightness currentDeviceTheme,
  ) {
    switch (currentDeviceTheme) {
      case Brightness.light:
        return themeData.lightThemeValueObject;
      case Brightness.dark:
        return themeData.darkThemeValueObject;
    }
  }
}
