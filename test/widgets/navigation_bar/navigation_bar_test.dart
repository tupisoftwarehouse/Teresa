import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/widgets/navigation_bar/navigation_bar.dart";
import "package:teresa/src/widgets/navigation_bar/navigation_bar_item.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("NavigationBar", () {
    testWidgets("should dispatch \"onTapped\" event when tapped", (
      WidgetTester tester,
    ) async {
      var isWidgetTapped = false;

      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: NavigationBar(
            items: [
              NavigationBarItem(
                icon: Symbols.equal_rounded,
                title: WIDGET_PRIMARY_TEXT,
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

      await tester.tap(find.text(WIDGET_PRIMARY_TEXT));

      expect(isWidgetTapped, true);
    });
  });
}
