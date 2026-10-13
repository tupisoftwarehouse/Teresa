import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/teresa_theme/colors/primary_color.dart";
import "package:teresa/src/teresa_theme/typography_styles/label_typography.dart";
import "package:teresa/src/widgets/page_content_wrapper.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Test \"PageContentWrapper\" Widget", () {
    testWidgets("Test If Widget Builds", (WidgetTester tester) async {
      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: PageContentWrapper(
            child: Text(
              WIDGET_PRIMARY_TEXT,
              style: LabelTypography.BOLD_12(PrimaryColor.VALUE_500),
            ),
          ),
        ),
      );

      expect(find.text(WIDGET_PRIMARY_TEXT), findsOneWidget);
    });
  });
}
