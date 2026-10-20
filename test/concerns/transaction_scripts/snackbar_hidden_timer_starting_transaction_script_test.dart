import "dart:async";

import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:fake_async/fake_async.dart";
import "package:teresa/src/concerns/transaction_scripts/snackbar_hidden_timer_starting_transaction_script.dart";
import "package:teresa/src/teresa_entities/reference_entity.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";

void main() {
  group("SnackbarHiddenTimerStartingTransactionScript", () {
    late final ValueNotifier<bool> isSnackbarShown;
    late final ReferenceEntity<Timer> snackbarHidingTimer;

    setUpAll(() {
      isSnackbarShown = ValueNotifier(true);

      snackbarHidingTimer = ReferenceEntity();
    });

    group("setSnackbarHiddenTimerListener", () {
      test("should cancel snackbar hidden timer when snackbar is not shown", () {
        fakeAsync((async) {
          SnackbarHiddenTimerStartingTransactionScript.startSnackbarHiddenTimer(
            snackbarHidingTimer,
            isSnackbarShown,
          );

          async.elapse(AnimationDuration.LONG);

          expect(isSnackbarShown.value, false);
        });
      });
    });
  });
}
