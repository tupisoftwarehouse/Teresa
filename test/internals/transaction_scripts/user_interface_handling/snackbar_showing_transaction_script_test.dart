import "dart:async";

import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/internals/transaction_scripts/user_interface_handling/snackbar_showing_transaction_script.dart";
import "package:teresa/src/teresa_entities/reference_entity.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";

void main() {
  group("SnackbarShowingTransactionScript", () {
    late ValueNotifier<bool> isShown;
    late ValueNotifier<bool> isElementShown;
    late ReferenceEntity<Timer> isShownTimer;
    late ReferenceEntity<Timer> isElementShownTimer;

    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();

      isShown = ValueNotifier(false);
      isElementShown = ValueNotifier(false);

      isShownTimer = ReferenceEntity();
      isElementShownTimer = ReferenceEntity();
    });

    group("showSnackbar", () {
      testWidgets(
        "should show snackbar and dispatch \"onTimeout\" when its automatic timeout dismiss timer ends",
        (WidgetTester tester) async {
          var isTimeoutExecuted = false;

          await tester.pumpWidget(
            Builder(
              builder: (context) {
                SnackbarShowingTransactionScript.showSnackbar(
                  isShown,
                  isElementShown,
                  isShownTimer,
                  isElementShownTimer,
                  () {
                    isTimeoutExecuted = true;
                  },
                );

                return Placeholder();
              },
            ),
          );

          expect(isShown.value, true);
          expect(isElementShown.value, true);
          expect(isShownTimer.isInitialized, true);
          expect(isElementShownTimer.isInitialized, false);

          await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

          expect(isShown.value, false);
          expect(isElementShown.value, true);
          expect(isShownTimer.value, isA<Timer>());
          expect(isElementShownTimer.isInitialized, true);

          await tester.pump(AnimationDuration.LONG);

          expect(isElementShown.value, false);
          expect(isTimeoutExecuted, true);
        },
      );
    });
  });
}
