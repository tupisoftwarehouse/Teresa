import "dart:async";

import "package:flutter/widgets.dart";
import "package:teresa/src/teresa_entities/reference_entity.dart";

class SnackbarHiddenTimerCancellingListenerSettingTransactionScript {
  SnackbarHiddenTimerCancellingListenerSettingTransactionScript._();

  static void setSnackbarHiddenTimerCancellingListener(
    ValueNotifier<bool> isSnackbarShown,
    ReferenceEntity<Timer> snackbarHidingTimer,
  ) {
    isSnackbarShown.addListener(() {
      if (!isSnackbarShown.value && snackbarHidingTimer.isInitialized) {
        snackbarHidingTimer.value.cancel();
      }
    });
  }
}
