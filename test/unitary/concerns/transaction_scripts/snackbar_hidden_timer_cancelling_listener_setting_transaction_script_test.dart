import "dart:async";

import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/concerns/transaction_scripts/snackbar_hidden_timer_cancelling_listener_setting_transaction_script.dart";
import "package:teresa/src/teresa_entities/reference_entity.dart";

void main() {
  group("SnackbarHiddenTimerListenerSettingTransactionScript", () {
    late final ValueNotifier<bool> isSnackbarShown;
    late final ReferenceEntity<Timer> snackbarHidingTimer;

    setUpAll(() {
      isSnackbarShown = ValueNotifier(true);

      snackbarHidingTimer = ReferenceEntity();

      snackbarHidingTimer.value = Timer(Duration.zero, () {});
    });

    group("setSnackbarHiddenTimerListener", () {
      test("should cancel snackbar hidden timer when snackbar is not shown and timer is initialized", () {
        SnackbarHiddenTimerCancellingListenerSettingTransactionScript.setSnackbarHiddenTimerCancellingListener(
          isSnackbarShown,
          snackbarHidingTimer,
        );

        isSnackbarShown.value = false;

        expect(snackbarHidingTimer.value.isActive, false);
      });
    });
  });
}
