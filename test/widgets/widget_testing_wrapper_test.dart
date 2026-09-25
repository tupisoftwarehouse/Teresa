import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Test \"WidgetTestingWrapper\" Widget", () {
    testWidgets("Test If Widget Builds", (WidgetTester tester) async {
      await tester.pumpWidget(
        WidgetTestingWrapper(child: Text(WIDGET_PRIMARY_TEXT)),
      );

      expect(find.text(WIDGET_PRIMARY_TEXT), findsOneWidget);
    });
  });
}
