import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/teresa_entities/reference_entity.dart";

void main() {
  group("ReferenceEntity", () {
    group("setObserver", () {
      test("should execute callback when value is updated", () {
        late bool isCallbackExecuted;
        final instance = ReferenceEntity<String>();

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
  });
}
