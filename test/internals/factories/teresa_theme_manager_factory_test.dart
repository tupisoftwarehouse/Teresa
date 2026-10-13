import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/internals/factories/teresa_theme_manager_factory.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/abstract/abstract_teresa_theme_value_object.dart";

void main() {
  group("Test \"TeresaThemeManagerFactory\" Class", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    test("Test If Method \"getInstance\" Returns An Instance And Sets Device Theme Change Observer", () {
      final instance = TeresaThemeManagerFactory.getInstance(TERESA_THEME_DATA);

      expect(instance.theme.value, isA<AbstractTeresaThemeValueObject>());
    });
  });
}
