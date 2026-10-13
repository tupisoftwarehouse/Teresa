import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/orientation/orientation.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";
import "package:teresa/src/widgets/divider.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Test \"Divider\" Widget", () {
    testWidgets("Test If Widget Builds", (WidgetTester tester) async {
      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: Divider(
            color: NeutralColor.VALUE_300,
            orientation: Orientation.HORIZONTAL,
          ),
        ),
      );

      expect(find.byType(Divider), findsOneWidget);
    });
  });
}
