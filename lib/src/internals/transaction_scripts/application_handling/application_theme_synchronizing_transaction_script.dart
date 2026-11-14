import "package:flutter/widgets.dart";
import "package:teresa/src/internals/concerns/theme_selector.dart";
import "package:teresa/src/internals/managers/teresa_theme_manager.dart";
import "package:teresa/src/teresa_theme_data/teresa_theme_data.dart";

class ApplicationThemeSynchronizingTransactionScript {
  ApplicationThemeSynchronizingTransactionScript._();

  static void synchronizeApplicationTheme(
    TeresaThemeData themeData,
    Brightness currentDeviceTheme,
    TeresaThemeManager themeViewModel,
  ) {
    themeViewModel.theme.value = ThemeSelector.getSelectedTheme(
      themeData,
      currentDeviceTheme,
    );
  }
}
