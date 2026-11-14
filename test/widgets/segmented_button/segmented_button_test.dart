import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/widgets/segmented_button/segmented_button.dart";
import "package:teresa/src/widgets/segmented_button/segmented_button_item.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("SegmentedButton", () {
    testWidgets("should dispatch \"onTapped\" event when tapped", (
      WidgetTester tester,
    ) async {
      var isWidgetTapped = false;

      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: SegmentedButton(
            label: WIDGET_PRIMARY_TEXT,
            items: [
              SegmentedButtonItem(
                title: WIDGET_SECONDARY_TEXT,
                isSelected: true,
                accessibilityLabel: WIDGET_ACCESSIBILITY_LABEL,
                onTapped: () {
                  isWidgetTapped = true;
                },
              ),
            ],
          ),
        ),
      );

      await tester.tap(find.text(WIDGET_SECONDARY_TEXT));

      expect(isWidgetTapped, true);
    });
  });
}
