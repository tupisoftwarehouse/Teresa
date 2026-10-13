import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/inherited_widgets/device_language_string_manager.dart"
    as device_language_string_manager_inherited_widget;
import "package:teresa/src/internals/managers/device_language_string_manager.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Test \"DeviceLanguageStringManager\" Inherited Widget", () {
    late DeviceLanguageStringManager deviceLanguageStringManagerToBeProvided;

    setUp(() {
      deviceLanguageStringManagerToBeProvided = DeviceLanguageStringManager(
        CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
        (_) {},
      );
    });

    testWidgets(
      "Test If Provides \"DeviceLanguageStringManager\" To Its Children",
      (tester) async {
        late final DeviceLanguageStringManager deviceLanguageStringManager;

        await tester.pumpWidget(
          WidgetTestingWrapper(
            child:
                device_language_string_manager_inherited_widget.DeviceLanguageStringManager(
                  deviceLanguageStringManager:
                      deviceLanguageStringManagerToBeProvided,
                  child: Builder(
                    builder: (context) {
                      deviceLanguageStringManager =
                          device_language_string_manager_inherited_widget
                              .DeviceLanguageStringManager.of(context);

                      return APPLICATION_HOME_SCREEN;
                    },
                  ),
                ),
          ),
        );

        expect(deviceLanguageStringManager, isA<DeviceLanguageStringManager>());
      },
    );
  });
}
