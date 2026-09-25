import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/widgets/action_button.dart";
import "package:teresa/src/widgets/scaffold.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Test \"Scaffold\" Widget", () {
    testWidgets("Test If Widget Dispatches \"onTap\" Event On Tapped", (
      WidgetTester tester,
    ) async {
      bool isBackButtonTapped = false;
      bool isActionButtonTapped = false;

      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: Scaffold(
            actionButtons: [
              ActionButton(
                icon: Symbols.history_2,
                tooltipMessage: WIDGET_TOOLTIP_MESSAGE,
                accessibilityLabel: WIDGET_ACCESSIBILITY_LABEL,
                onTap: () {
                  isActionButtonTapped = true;
                },
              ),
            ],
            onBackButtonTap: () {
              isBackButtonTapped = true;
            },
            body: Container(),
            backButtonTooltipMessage: BACK_BUTTON_TOOLTIP_MESSAGE,
            backButtonAccessibilityLabel: BACK_BUTTON_ACCESSIBILITY_LABEL,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.tap(find.byIcon(Symbols.history_2));

      expect(isBackButtonTapped, true);
      expect(isActionButtonTapped, true);
    });
  });
}
