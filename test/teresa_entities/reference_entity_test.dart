import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/teresa_entities/reference_entity.dart";

void main() {
  group("Test \"ReferenceEntity\" Entity", () {
    test(
      "Test If Method \"setObserver\" Executes Callback When Value Is Updated",
      () {
        late bool isCallbackExecuted;
        final instance = ReferenceEntity<String>();

        instance.setObserver(() {
          isCallbackExecuted = true;
        });

        instance.value = VALUE_TO_BE_HELD;

        expect(instance.value, VALUE_TO_BE_HELD);
        expect(isCallbackExecuted, true);
      },
    );
  });
}
