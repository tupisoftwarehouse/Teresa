import "package:flutter_test/flutter_test.dart";
import "package:flutter/widgets.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/internals/managers/teresa_theme_manager.dart";
import "package:teresa/src/internals/widgets_binding_observers/theme_widgets_binding_observer.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/abstract/abstract_teresa_theme_value_object.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/concrete/concrete_light_teresa_theme_value_object.dart";

void main() {
  group("ThemeWidgetsBindingObserver", () {
    late ThemeWidgetsBindingObserver themeWidgetsBindingObserver;
    late TeresaThemeManager themeManager;

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    setUp(() {
      themeManager = TeresaThemeManager(
        const ConcreteLightTeresaThemeValueObject(),
        (_) {},
      );

      themeWidgetsBindingObserver = ThemeWidgetsBindingObserver(
        TERESA_THEME_DATA,
        themeManager,
      );
    });

    group("didChangeAppLifecycleState", () {
      test(
        "should update theme in the manager when the application resumes",
        () {
          themeWidgetsBindingObserver.didChangeAppLifecycleState(
            AppLifecycleState.resumed,
          );

          expect(
            themeManager.theme.value,
            isA<AbstractTeresaThemeValueObject>(),
          );
        },
      );
    });

    group("didChangePlatformBrightness", () {
      test(
        "should update theme in the manager when the device theme changes",
        () {
          themeWidgetsBindingObserver.didChangePlatformBrightness();

          expect(
            themeManager.theme.value,
            isA<AbstractTeresaThemeValueObject>(),
          );
        },
      );
    });
  });
}
