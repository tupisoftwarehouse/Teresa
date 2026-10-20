import "package:flutter/widgets.dart";
import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/inherited_widgets/device_language_strings.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/inherited_widgets/device_language_string_manager.dart";
import "package:teresa/src/inherited_widgets/teresa_theme_manager.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("WidgetTestingWrapper", () {
    testWidgets("should build with specified configurations", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        WidgetTestingWrapper(
          mediaQueryData: MEDIA_QUERY_DATA,
          theme: TERESA_THEME,
          deviceLanguageStrings: CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
          child: Placeholder(),
        ),
      );

      expect(
        find.ancestor(
          of: find.byType(material.MaterialApp),
          matching: find.byWidgetPredicate((widget) {
            return widget is MediaQuery && widget.data == MEDIA_QUERY_DATA;
          }),
        ),
        findsOneWidget,
      );
      expect(find.byType(TeresaTheme), findsOne);
      expect(find.byType(TeresaThemeManager), findsOne);
      expect(find.byType(DeviceLanguageStrings<String>), findsOne);
      expect(find.byType(DeviceLanguageStringManager<String>), findsOne);
      expect(find.byType(Placeholder), findsOne);
    });
  });
}
