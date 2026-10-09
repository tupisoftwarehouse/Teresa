import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/inherited_widgets/device_language_strings.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Test \"DeviceLanguageStrings\" Inherited Widget", () {
    testWidgets("Test If Provides Device Language Strings To Its Children", (
      tester,
    ) async {
      late final String deviceLanguageStrings;

      await tester.pumpWidget(
        WidgetTestingWrapper(
          child: DeviceLanguageStrings(
            deviceLanguageStrings: CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
            child: Builder(
              builder: (context) {
                deviceLanguageStrings = DeviceLanguageStrings.of(context);

                return APPLICATION_HOME_SCREEN;
              },
            ),
          ),
        ),
      );

      expect(deviceLanguageStrings, CONCRETE_ENGLISH_APPLICATION_LANGUAGE);
    });
  });
}
