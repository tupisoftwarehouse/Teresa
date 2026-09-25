import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/abstract/abstract_teresa_theme_value_object.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Test \"TeresaTheme\" Inherited Widget", () {
    testWidgets("Test If Provides Teresa Theme To Its Children", (
      tester,
    ) async {
      late final AbstractTeresaThemeValueObject teresaTheme;

      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: TeresaTheme(
            theme: TERESA_THEME,
            child: Builder(
              builder: (context) {
                teresaTheme = TeresaTheme.of(context);

                return APPLICATION_HOME_SCREEN;
              },
            ),
          ),
        ),
      );

      expect(teresaTheme, TERESA_THEME);
    });
  });
}
