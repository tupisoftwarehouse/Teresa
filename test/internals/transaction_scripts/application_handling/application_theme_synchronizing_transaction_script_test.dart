import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/internals/managers/teresa_theme_manager.dart";
import "package:teresa/src/internals/transaction_scripts/application_handling/application_theme_synchronizing_transaction_script.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/concrete/concrete_light_teresa_theme_value_object.dart";

void main() {
  group("ApplicationThemeSynchronizingTransactionScript", () {
    late TeresaThemeManager teresaThemeManager;

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();

      teresaThemeManager = TeresaThemeManager(
        TERESA_THEME_DATA.darkThemeValueObject,
        (_) {},
      );
    });

    group("synchronizeApplicationTheme", () {
      test("should update theme in the manager", () {
        ApplicationThemeSynchronizingTransactionScript.synchronizeApplicationTheme(
          TERESA_THEME_DATA,
          Brightness.light,
          teresaThemeManager,
        );

        expect(
          teresaThemeManager.theme.value,
          isA<ConcreteLightTeresaThemeValueObject>(),
        );
      });
    });
  });
}
