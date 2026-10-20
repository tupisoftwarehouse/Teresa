import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/widgets/icon_button.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("IconButton", () {
    testWidgets("should dispatch \"onTap\" event when tapped", (
      WidgetTester tester,
    ) async {
      var isWidgetTapped = false;

      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: IconButton(
            icon: Symbols.add_rounded,
            title: WIDGET_PRIMARY_TEXT,
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
