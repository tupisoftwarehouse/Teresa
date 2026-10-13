import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/widgets/debug_mode_banner.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Test \"DebugModeBanner\" Widget", () {
    testWidgets("Test If Widget Builds", (WidgetTester tester) async {
      await tester.pumpWidget(
        WidgetTestingWrapper(child: Stack(children: [DebugModeBanner()])),
      );

      expect(find.text(DEBUG_MODE_BANNER_LABEL), findsOneWidget);
    });
  });
}
