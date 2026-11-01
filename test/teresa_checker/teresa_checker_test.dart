import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/teresa.dart";

void main() {
  group("TeresaChecker", () {
    group("isIsObjectNotInitialized", () {
      test("should return true when object is not initialized", () {
        final objectIsNotInitialized = isObjectNotInitialized(null);
        final objectIsInitialized = isObjectNotInitialized(INITIALIZED_OBJECT);

        expect(objectIsNotInitialized, true);
        expect(objectIsInitialized, false);
      });
    });
  });
}
