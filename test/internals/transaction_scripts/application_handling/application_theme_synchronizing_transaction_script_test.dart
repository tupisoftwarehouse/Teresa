import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/internals/managers/teresa_theme_manager.dart";
import "package:teresa/src/internals/transaction_scripts/application_handling/application_theme_synchronizing_transaction_script.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/concrete/concrete_light_teresa_theme_value_object.dart";

void main() {
  group("Test \"ApplicationThemeSynchronizingTransactionScript\" Class", () {
    late TeresaThemeManager teresaThemeManager;

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();

      teresaThemeManager = TeresaThemeManager(
        TERESA_THEME_DATA.darkThemeValueObject,
        (_) {},
      );
    });

    test("Test If Method \"synchronizeApplicationTheme\" Updates Theme In The Manager", () {
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
}
