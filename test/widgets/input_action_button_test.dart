import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/widgets/input_action_button.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("InputActionButton", () {
    testWidgets("should dispatch \"onTap\" event when tapped", (
      WidgetTester tester,
    ) async {
      var isWidgetTapped = false;

      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: InputActionButton(
            icon: Symbols.add_rounded,
            tooltipMessage: WIDGET_TOOLTIP_MESSAGE,
            accessibilityLabel: WIDGET_ACCESSIBILITY_LABEL,
            onTap: () {
              isWidgetTapped = true;
            },
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.add_rounded));

      expect(isWidgetTapped, true);
    });
  });
}
