import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/widgets/debug_mode_banner.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("DebugModeBanner", () {
    testWidgets("should build", (WidgetTester tester) async {
      await tester.pumpWidget(
        WidgetTestingWrapper(child: Stack(children: [DebugModeBanner()])),
      );

      expect(find.text(DEBUG_MODE_BANNER_LABEL), findsOneWidget);
    });
  });
}
