import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/widgets/snackbar.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Test \"Snackbar\" Widget", () {
    testWidgets(
      "Test If Widget Dispatches \"onTap\" Event On Tapped And Executes \"onTimeout\" Event After Delay",
      (WidgetTester tester) async {
        bool isWidgetTapped = false;
        bool isTimeoutActionExecuted = false;

        await tester.pumpWidget(
          WidgetTestingWrapper(
            child: Snackbar(
              message: WIDGET_PRIMARY_TEXT,
              description: WIDGET_SECONDARY_TEXT,
              icon: Symbols.settings_backup_restore_rounded,
              buttonAccessibilityLabel: WIDGET_ACCESSIBILITY_LABEL,
              buttonTooltipMessage: WIDGET_TOOLTIP_MESSAGE,
              onTap: () {
                isWidgetTapped = true;
              },
              onTimeout: () {
                isTimeoutActionExecuted = true;
              },
            ),
          ),
        );

        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Symbols.settings_backup_restore_rounded));

        await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

        expect(isWidgetTapped, true);
        expect(isTimeoutActionExecuted, true);
      },
    );
  });
}
