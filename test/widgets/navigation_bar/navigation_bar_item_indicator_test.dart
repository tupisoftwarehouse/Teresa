import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/widgets/navigation_bar/navigation_bar_item_indicator.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Test \"NavigationBarItemIndicator\" Widget", () {
    testWidgets("Test If Widget Builds", (WidgetTester tester) async {
      await tester.pumpWidget(
        WidgetTestingWrapper(child: NavigationBarItemIndicator(isShown: true)),
      );

      expect(find.byType(NavigationBarItemIndicator), findsOneWidget);
    });
  });
}
