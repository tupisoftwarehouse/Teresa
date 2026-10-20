import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/widgets/dropdown_menu/dropdown_menu_item.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("DropdownMenuItem", () {
    testWidgets("should dispatch \"onTap\" event when tapped", (
      WidgetTester tester,
    ) async {
      var isWidgetTapped = false;

      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: DropdownMenuItem(
            label: WIDGET_PRIMARY_TEXT,
            abbreviation: WIDGET_SECONDARY_TEXT,
            isSelected: false,
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
