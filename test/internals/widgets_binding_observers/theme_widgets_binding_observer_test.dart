import "package:flutter_test/flutter_test.dart";
import "package:flutter/widgets.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/internals/managers/teresa_theme_manager.dart";
import "package:teresa/src/internals/widgets_binding_observers/theme_widgets_binding_observer.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/abstract/abstract_teresa_theme_value_object.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/concrete/concrete_light_teresa_theme_value_object.dart";

void main() {
  group("Test \"ThemeWidgetsBindingObserver\" Class", () {
    late ThemeWidgetsBindingObserver themeWidgetsBindingObserver;
    late TeresaThemeManager themeManager;

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    setUp(() {
      themeManager = TeresaThemeManager(
        ConcreteLightTeresaThemeValueObject(),
        (_) {},
      );

      themeWidgetsBindingObserver = ThemeWidgetsBindingObserver(
        TERESA_THEME_DATA,
        themeManager,
      );
    });

    test("Test If Method \"didChangeAppLifecycleState\" Updates Theme In The Manager On Resumed as Application Lifecycle State", () {
      themeWidgetsBindingObserver.didChangeAppLifecycleState(
        AppLifecycleState.resumed,
      );

      expect(themeManager.theme.value, isA<AbstractTeresaThemeValueObject>());
    });

    test("Test If Method \"didChangePlatformBrightness\" Updates Theme In The Manager On Device Theme Change", () {
      themeWidgetsBindingObserver.didChangePlatformBrightness();

      expect(themeManager.theme.value, isA<AbstractTeresaThemeValueObject>());
    });
  });
}
