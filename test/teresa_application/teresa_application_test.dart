import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/teresa_application/teresa_application.dart";
import "package:teresa/src/widgets/debug_mode_banner.dart";

void main() {
  group("Test \"TeresaApplication\" Widget", () {
    testWidgets("Test If Renders Application On Device's Platform", (
      tester,
    ) async {
      await tester.pumpWidget(
        TeresaApplication(
          title: APPLICATION_TITLE,
          themeData: TERESA_THEME_DATA,
          deviceLanguageStringData: DEVICE_LANGUAGE_STRING_DATA,
          home: APPLICATION_HOME_SCREEN,
        ),
      );

      expect(find.byKey(HOME_SCREEN_KEY), findsOneWidget);
    });

    testWidgets("Test If Renders Debug Mode Banner On Debug Build", (
      tester,
    ) async {
      await tester.pumpWidget(
        TeresaApplication(
          title: APPLICATION_TITLE,
          themeData: TERESA_THEME_DATA,
          deviceLanguageStringData: DEVICE_LANGUAGE_STRING_DATA,
          home: APPLICATION_HOME_SCREEN,
        ),
      );

      expect(find.byType(DebugModeBanner), findsOneWidget);
    });
  });
}
