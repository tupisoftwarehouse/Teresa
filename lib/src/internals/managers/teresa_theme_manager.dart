import "package:flutter/foundation.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/abstract/abstract_teresa_theme_value_object.dart";

class TeresaThemeManager {
  final ValueNotifier<AbstractTeresaThemeValueObject> theme;

  TeresaThemeManager(
    AbstractTeresaThemeValueObject currentDeviceTheme,
    void Function(TeresaThemeManager themeManager) setThemeChangeObserver,
  ) : theme = ValueNotifier<AbstractTeresaThemeValueObject>(
        currentDeviceTheme,
      ) {
    setThemeChangeObserver(this);
  }
}
