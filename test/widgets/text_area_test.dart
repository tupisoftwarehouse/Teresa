import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/widgets/text_area.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Test \"TextArea\" Widget", () {
    testWidgets(
      "Test If Widget Dispatches \"onChange\" Event On Text Changed",
      (WidgetTester tester) async {
        final controller = TextEditingController();
        String changedText = "";

        await tester.pumpWidget(
          WidgetTestingWrapper(
            child: TextArea(
              placeholder: WIDGET_PRIMARY_TEXT,
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
  });
}
