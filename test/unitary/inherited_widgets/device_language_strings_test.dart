import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/inherited_widgets/device_language_strings.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("DeviceLanguageStrings", () {
    testWidgets("should provide device language strings to its children", (
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
