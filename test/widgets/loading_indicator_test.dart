import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/widgets/loading_indicator.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Test \"LoadingIndicator\" Widget", () {
    testWidgets("Test If Widget Builds", (WidgetTester tester) async {
      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: LoadingIndicator(
            accessibilityLabel: WIDGET_ACCESSIBILITY_LABEL,
          ),
        ),
      );

      expect(find.byType(LoadingIndicator), findsOneWidget);
    });
  });
}
