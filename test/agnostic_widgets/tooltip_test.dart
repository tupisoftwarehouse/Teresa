import "package:flutter/material.dart" as material;
import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/agnostic_widgets/surface.dart";
import "package:teresa/src/agnostic_widgets/tooltip.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";
import "package:teresa/src/teresa_theme/typography_styles/label_typography.dart";

void main() {
  group("Test \"Tooltip\" Widget", () {
    testWidgets("Test If Widget Builds", (WidgetTester tester) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: material.Scaffold(
            body: Tooltip(
              message: WIDGET_TOOLTIP_MESSAGE,
              verticalDisplacement: 24,
              child: Surface(
                backgroundColor: NeutralColor.VALUE_50,
                borderColor: NeutralColor.VALUE_300,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: 6,
                    horizontal: 12,
                  ),
                  child: Text(
                    WIDGET_PRIMARY_TEXT,
                    style: LabelTypography.BOLD_12(NeutralColor.VALUE_900),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byTooltip(WIDGET_TOOLTIP_MESSAGE), findsOneWidget);
    });
  });
}
