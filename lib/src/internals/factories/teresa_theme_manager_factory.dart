import "package:teresa/src/internals/checker/teresa_checker.dart";
import "package:teresa/src/internals/concerns/theme_selector.dart";
import "package:teresa/src/teresa_theme_data/teresa_theme_data.dart";
import "package:teresa/src/internals/widgets_binding_observers/theme_widgets_binding_observer.dart";
import "package:teresa/src/internals/managers/teresa_theme_manager.dart";
import "package:flutter/widgets.dart";

class TeresaThemeManagerFactory {
  static TeresaThemeManager? _instance;

  TeresaThemeManagerFactory._();

  static TeresaThemeManager getInstance(TeresaThemeData themeData) {
    if (isObjectNotInitialized(_instance)) {
      final currentThemeBasedOnDeviceTheme = ThemeSelector.getSelectedTheme(
        themeData,
        WidgetsBinding.instance.platformDispatcher.platformBrightness,
      );

      _instance = TeresaThemeManager(currentThemeBasedOnDeviceTheme, (
        themeManager,
      ) {
        final themeWidgetsBindingObserver = ThemeWidgetsBindingObserver(
          themeData,
          themeManager,
        );

        WidgetsBinding.instance.addObserver(themeWidgetsBindingObserver);
      });
    }

    return _instance!;
  }
}
