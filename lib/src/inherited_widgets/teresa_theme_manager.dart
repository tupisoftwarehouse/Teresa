import "package:flutter/widgets.dart";
import "package:teresa/src/internals/checker/teresa_checker.dart";
import "package:teresa/src/internals/managers/teresa_theme_manager.dart"
    as teresa_theme_manager_implementation;

class TeresaThemeManager extends InheritedWidget {
  final teresa_theme_manager_implementation.TeresaThemeManager
  teresaThemeManager;

  const TeresaThemeManager({
    super.key,
    required this.teresaThemeManager,
    required super.child,
  });

  static teresa_theme_manager_implementation.TeresaThemeManager of(
    BuildContext context,
  ) {
    final currentWidget = context
        .dependOnInheritedWidgetOfExactType<TeresaThemeManager>();

    return currentWidget!.teresaThemeManager;
  }

  @override
  bool updateShouldNotify(TeresaThemeManager oldWidget) {
    return isThemeUpdated(
      teresaThemeManager.theme.value,
      oldWidget.teresaThemeManager.theme.value,
    );
  }
}
