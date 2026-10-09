import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/widgets/input.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Test \"Input\" Widget", () {
    late TextEditingController controller;

    setUp(() {
      controller = TextEditingController();
    });

    testWidgets(
      "Test If Widget Dispatches \"onChange\" Event On Text Changed",
      (WidgetTester tester) async {
        var changedText = "";

        await tester.pumpWidget(
          WidgetTestingWrapper(
            child: Input(
              hintText: WIDGET_PRIMARY_TEXT,
              type: TextInputType.number,
              controller: controller,
              focusNode: FOCUS_NODE,
              onChanged: (value) {
                changedText = value;
              },
            ),
          ),
        );

        await tester.enterText(
          find.byType(TextField),
          TEXT_FROM_USER_INTERACTION,
        );

        expect(changedText, TEXT_FROM_USER_INTERACTION);

        expect(controller.text, TEXT_FROM_USER_INTERACTION);
      },
    );

    testWidgets("Test Input Unfocus On Tap Outside", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: Input(
            hintText: WIDGET_PRIMARY_TEXT,
            type: TextInputType.number,
            controller: controller,
            focusNode: FOCUS_NODE,
            onChanged: (_) {},
          ),
        ),
      );

      await tester.tap(find.byType(TextField));

      await tester.pump();

      expect(
        tester
            .widget<EditableText>(find.byType(EditableText))
            .focusNode
            .hasFocus,
        true,
      );

      await tester.tapAt(WIDGET_OUTSIDE_OFFSET);

      await tester.pump();

      expect(
        tester
            .widget<EditableText>(find.byType(EditableText))
            .focusNode
            .hasFocus,
        false,
      );
    });
  });
}
