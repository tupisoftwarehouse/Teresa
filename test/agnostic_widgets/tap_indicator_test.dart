import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/agnostic_widgets/tap_indicator.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";

void main() {
  group("Test \"TapIndicator\" Widget", () {
    testWidgets("Test If Widget Dispatches \"onTap\" Event On Tapped", (
      WidgetTester tester,
    ) async {
      bool isWidgetTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TapIndicator(
              indicatorColor: NeutralColor.VALUE_900,
              onTap: () {
                isWidgetTapped = true;
              },
              child: Container(),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TapIndicator));

      expect(isWidgetTapped, true);
    });
  });
}
