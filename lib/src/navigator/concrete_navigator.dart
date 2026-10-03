import "dart:io";

import "package:flutter/cupertino.dart" as cupertino;
import "package:flutter/material.dart" as material;
import "package:flutter/widgets.dart" as widgets;
import "package:teresa/src/inherited_widgets/device_language_string_manager.dart"
    as device_language_string_manager_inherited_widgets;
import "package:teresa/src/inherited_widgets/device_language_strings.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/inherited_widgets/teresa_theme_manager.dart"
    as teresa_theme_manager_inherited_widgets;
import "package:teresa/src/navigator/abstract_navigator.dart";

class ConcreteNavigator<T> implements AbstractNavigator<T> {
  @override
  void navigate(widgets.BuildContext context, widgets.Widget screen) {
    final widgets.Widget Function(widgets.BuildContext) builder = (_) {
      final deviceLanguageStringManager =
          device_language_string_manager_inherited_widgets
              .DeviceLanguageStringManager.of<T>(context);
      final teresaThemeManager =
          teresa_theme_manager_inherited_widgets.TeresaThemeManager.of(context);

      return device_language_string_manager_inherited_widgets.DeviceLanguageStringManager<
        T
      >(
        deviceLanguageStringManager: deviceLanguageStringManager,
        child: teresa_theme_manager_inherited_widgets.TeresaThemeManager(
          teresaThemeManager: teresaThemeManager,
          child: widgets.ValueListenableBuilder(
            valueListenable: deviceLanguageStringManager.deviceLanguageStrings,
            builder: (_, deviceLanguageStrings, _) {
              return widgets.ValueListenableBuilder(
                valueListenable: teresaThemeManager.theme,
                builder: (_, theme, _) {
                  return DeviceLanguageStrings(
                    deviceLanguageStrings: deviceLanguageStrings,
                    child: TeresaTheme(theme: theme, child: screen),
                  );
                },
              );
            },
          ),
        ),
      );
    };
    late final widgets.Route route = Platform.isIOS
        ? cupertino.CupertinoPageRoute(builder: builder)
        : material.MaterialPageRoute(builder: builder);

    widgets.Navigator.push(context, route);
  }

  @override
  void navigateBack(widgets.BuildContext context) {
    widgets.Navigator.pop(context);
  }
}
