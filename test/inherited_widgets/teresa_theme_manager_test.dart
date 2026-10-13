import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/inherited_widgets/teresa_theme_manager.dart"
    as teresa_theme_manager_inherited_widget;
import "package:teresa/src/internals/managers/teresa_theme_manager.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Test \"TeresaThemeManager\" Inherited Widget", () {
    late TeresaThemeManager teresaThemeManagerToBeProvided;

    setUp(() {
      teresaThemeManagerToBeProvided = TeresaThemeManager(TERESA_THEME, (_) {});
    });

    testWidgets("Test If Provides \"TeresaThemeManager\" To Its Children", (
      tester,
    ) async {
      late final TeresaThemeManager teresaThemeManager;

      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: teresa_theme_manager_inherited_widget.TeresaThemeManager(
            teresaThemeManager: teresaThemeManagerToBeProvided,
            child: Builder(
              builder: (context) {
                teresaThemeManager = teresa_theme_manager_inherited_widget
                    .TeresaThemeManager.of(context);

                return APPLICATION_HOME_SCREEN;
              },
            ),
          ),
        ),
      );

      expect(teresaThemeManager, isA<TeresaThemeManager>());
    });
  });
}
