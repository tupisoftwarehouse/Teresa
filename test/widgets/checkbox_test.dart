import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/widgets/checkbox.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Test \"Checkbox\" Widget", () {
    testWidgets("Test If Widget Dispatches \"onTap\" Event On Tapped", (
      WidgetTester tester,
    ) async {
      bool isWidgetTapped = false;

      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: Checkbox(
            isChecked: false,
            tooltipMessage: WIDGET_TOOLTIP_MESSAGE,
            accessibilityLabel: WIDGET_ACCESSIBILITY_LABEL,
            onTap: () {
              isWidgetTapped = true;
            },
          ),
        ),
      );

      await tester.tap(find.bySemanticsLabel(WIDGET_ACCESSIBILITY_LABEL));

      expect(isWidgetTapped, true);
    });
  });
}
