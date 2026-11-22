import "package:build_context_mock/build_context_mock.dart";
import "package:flutter/widgets.dart" hide Navigator;
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/navigator/abstract_navigator.dart";
import "package:teresa/src/navigator/navigator_mock.dart";

void main() {
  group("Navigator", () {
    late BuildContext context;
    late AbstractNavigator navigator;

    setUpAll(() {
      context = BuildContextMock();
    });

    group("navigate", () {
      test("should navigate to screen", () {
        var isScreenNavigated = false;
        navigator = NavigatorMock((_, _) {
          isScreenNavigated = true;
        }, (_) {});

        navigator.navigate(context, SCREEN_TO_BE_NAVIGATED);

        expect(isScreenNavigated, true);
      });
    });

    group("navigateBack", () {
      test("should navigate back to screen", () {
        var isScreenBackNavigated = false;
        navigator = NavigatorMock((_, _) {}, (_) {
          isScreenBackNavigated = true;
        });

        navigator.navigateBack(context);

        expect(isScreenBackNavigated, true);
      });
    });
  });
}
