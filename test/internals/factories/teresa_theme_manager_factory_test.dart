import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/internals/factories/teresa_theme_manager_factory.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/abstract/abstract_teresa_theme_value_object.dart";

void main() {
  group("TeresaThemeManagerFactory", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    group("getInstance", () {
      test(
        "should return an instance and set device theme change observer",
        () {
          final instance = TeresaThemeManagerFactory.getInstance(
            TERESA_THEME_DATA,
          );

          expect(instance.theme.value, isA<AbstractTeresaThemeValueObject>());
        },
      );
    });
  });
}
