import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/inherited_widgets/device_language_strings.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/inherited_widgets/device_language_string_manager.dart";
import "package:teresa/src/inherited_widgets/teresa_theme_manager.dart";
import "package:teresa/src/widgets/widget_previewing_wrapper.dart";

void main() {
  group("WidgetPreviewingWrapper", () {
    testWidgets("should build with specified configurations", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        WidgetPreviewingWrapper(
          theme: TERESA_THEME,
          deviceLanguageStrings: CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
          child: Placeholder(),
        ),
      );

      expect(find.byType(TeresaTheme), findsOne);
      expect(find.byType(TeresaThemeManager), findsOne);
      expect(find.byType(DeviceLanguageStrings<String>), findsOne);
      expect(find.byType(DeviceLanguageStringManager<String>), findsOne);
      expect(find.byType(Placeholder), findsOne);
    });
  });
}
