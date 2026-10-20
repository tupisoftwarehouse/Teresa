import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/widgets/segmented_button/segmented_button_item.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("SegmentedButtonItem", () {
    testWidgets("should dispatch \"onTap\" event when tapped", (
      WidgetTester tester,
    ) async {
      var isWidgetTapped = false;

      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: SegmentedButtonItem(
            title: WIDGET_PRIMARY_TEXT,
            isSelected: true,
            accessibilityLabel: WIDGET_ACCESSIBILITY_LABEL,
            onTap: () {
              isWidgetTapped = true;
            },
          ),
        ),
      );

      await tester.tap(find.text(WIDGET_PRIMARY_TEXT));

      expect(isWidgetTapped, true);
    });
  });
}
