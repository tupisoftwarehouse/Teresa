import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/agnostic_widgets/surface.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/teresa_theme/colors/primary_color.dart";
import "package:teresa/src/teresa_theme/colors/secondary_color.dart";
import "package:teresa/src/teresa_theme/typography_styles/label_typography.dart";

void main() {
  group("Test \"Surface\" Widget", () {
    testWidgets("Test If Widget Builds", (WidgetTester tester) async {
      final textStyle = LabelTypography.BOLD_12(PrimaryColor.VALUE_500);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Surface(
              backgroundColor: SecondaryColor.VALUE_900,
              borderColor: SecondaryColor.VALUE_800,
              borderRadius: BorderRadius.circular(textStyle.fontSize! / 2),
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: textStyle.fontSize! / 2,
                  horizontal: textStyle.fontSize!,
                ),
                child: Text(WIDGET_PRIMARY_TEXT, style: textStyle),
              ),
            ),
          ),
        ),
      );

      expect(find.text(WIDGET_PRIMARY_TEXT), findsOneWidget);
    });
  });
}
