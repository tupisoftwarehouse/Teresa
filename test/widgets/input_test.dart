import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/widgets/input.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Input", () {
    late TextEditingController controller;

    setUp(() {
      controller = TextEditingController();
    });

    testWidgets("should dispatch \"onChange\" event when the text changes", (
      WidgetTester tester,
    ) async {
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
    });

    testWidgets("should input unfocus on tap outside", (
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
