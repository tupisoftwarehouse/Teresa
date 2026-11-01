import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/widgets/action_button.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("ActionButton", () {
    testWidgets("should dispatch \"onTapped\" event when tapped", (
      WidgetTester tester,
    ) async {
      var isWidgetTapped = false;

      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: ActionButton(
            icon: Symbols.arrow_back_ios_new_rounded,
            tooltipMessage: WIDGET_TOOLTIP_MESSAGE,
            accessibilityLabel: WIDGET_ACCESSIBILITY_LABEL,
            onTapped: () {
              isWidgetTapped = true;
            },
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      expect(isWidgetTapped, true);
    });
  });
}
