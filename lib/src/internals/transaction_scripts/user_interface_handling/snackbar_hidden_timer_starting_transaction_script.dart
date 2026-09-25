import "dart:async";

import "package:flutter/widgets.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";

class SnackbarHiddenTimerStartingTransactionScript {
  SnackbarHiddenTimerStartingTransactionScript._();

  static void startSnackbarHiddenTimer(
    Timer? snackbarHidingTimer,
    ValueNotifier<bool> isSnackbarShown,
  ) {
    snackbarHidingTimer = Timer(AnimationDuration.LONG, () {
      isSnackbarShown.value = false;
    });
  }
}
