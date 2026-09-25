import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/widgets/input.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Test \"Input\" Widget", () {
    testWidgets(
      "Test If Widget Dispatches \"onChange\" Event On Text Changed",
      (WidgetTester tester) async {
        final controller = TextEditingController();
        String changedText = "";

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
  });
}
