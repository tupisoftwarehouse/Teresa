import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";
import "package:teresa/src/widgets/context_button.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("ContextButton", () {
    testWidgets("should dispatch \"onTapped\" event when tapped", (
      WidgetTester tester,
    ) async {
      var isWidgetTapped = false;

      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: ContextButton(
            icon: Symbols.delete_rounded,
            color: NeutralColor.VALUE_50,
            tapIndicatorColor: NeutralColor.VALUE_50,
            tooltipMessage: WIDGET_TOOLTIP_MESSAGE,
            accessibilityLabel: WIDGET_ACCESSIBILITY_LABEL,
            onTapped: () {
              isWidgetTapped = true;
            },
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.delete_rounded));

      expect(isWidgetTapped, true);
    });
  });
}
