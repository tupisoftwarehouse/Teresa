import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/teresa.dart";

void main() {
  group("Test \"TeresaChecker\" Module", () {
    test("Test If Function \"isIsObjectNotInitialized\" Returns True If Object Is Not Initialized", () {
      final objectIsNotInitialized = isObjectNotInitialized(null);
      final objectIsInitialized = isObjectNotInitialized(INITIALIZED_OBJECT);

      expect(objectIsNotInitialized, true);
      expect(objectIsInitialized, false);
    });
  });
}
