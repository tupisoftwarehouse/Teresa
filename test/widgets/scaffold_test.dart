import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/widgets/action_button.dart";
import "package:teresa/src/widgets/scaffold.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Scaffold", () {
    testWidgets("should dispatch back button event when tapped", (
      WidgetTester tester,
    ) async {
      var isBackButtonTapped = false;

      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: Scaffold(
            onBackButtonTapped: () {
              isBackButtonTapped = true;
            },
            actionButtons: [],
            body: Container(),
            backButtonTooltipMessage: BACK_BUTTON_TOOLTIP_MESSAGE,
            backButtonAccessibilityLabel: BACK_BUTTON_ACCESSIBILITY_LABEL,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      expect(isBackButtonTapped, true);
    });

    testWidgets("should dispatch action button event when tapped", (
      WidgetTester tester,
    ) async {
      var isActionButtonTapped = false;

      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: Scaffold(
            actionButtons: [
              ActionButton(
                icon: Symbols.history_2,
                tooltipMessage: WIDGET_TOOLTIP_MESSAGE,
                accessibilityLabel: WIDGET_ACCESSIBILITY_LABEL,
                onTapped: () {
                  isActionButtonTapped = true;
                },
              ),
            ],
            onBackButtonTapped: () {},
            body: Container(),
            backButtonTooltipMessage: BACK_BUTTON_TOOLTIP_MESSAGE,
            backButtonAccessibilityLabel: BACK_BUTTON_ACCESSIBILITY_LABEL,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2));

      expect(isActionButtonTapped, true);
    });
  });
}
