import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/teresa_entities/reference_entity.dart";

void main() {
  group("ReferenceEntity", () {
    group("setObserver", () {
      test("should execute callback when value is updated", () {
        final instance = ReferenceEntity<String>();
        var isCallbackExecuted = false;

        instance.setObserver(() {
          isCallbackExecuted = true;
        });

        expect(instance.isInitialized, false);

        instance.value = VALUE_TO_BE_HELD;

        expect(instance.value, VALUE_TO_BE_HELD);

        expect(instance.isInitialized, true);

        expect(isCallbackExecuted, true);
      });
    });

    group("deinitialize", () {
      test("should clear the value and remove the observer", () {
        final instance = ReferenceEntity<String>();
        var isCallbackExecuted = false;

        instance.value = VALUE_TO_BE_HELD;

        instance.setObserver(() {
          isCallbackExecuted = true;
        });

        instance.deinitialize();

        expect(instance.isInitialized, false);

        try {
          final _ = instance.value;
        } catch (error) {
          expect(error, isA<Error>());
        }

        instance.value = VALUE_TO_BE_HELD;

        expect(isCallbackExecuted, false);
      });
    });
  });
}
