import "dart:async";

import "package:flutter/widgets.dart";
import "package:teresa/src/teresa_entities/reference_entity.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";

class SnackbarHiddenTimerStartingTransactionScript {
  SnackbarHiddenTimerStartingTransactionScript._();

  static void startSnackbarHiddenTimer(
    ReferenceEntity<Timer> snackbarHidingTimer,
    ValueNotifier<bool> isSnackbarShown,
  ) {
    snackbarHidingTimer.value = Timer(AnimationDuration.LONG, () {
      isSnackbarShown.value = false;
    });
  }
}
