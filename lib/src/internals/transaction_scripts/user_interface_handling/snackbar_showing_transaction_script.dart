import "dart:async";

import "package:flutter/widgets.dart";
import "package:teresa/src/constants/teresa_constants.dart";
import "package:teresa/src/teresa_entities/reference_entity.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";

class SnackbarShowingTransactionScript {
  SnackbarShowingTransactionScript._();

  static void showSnackbar(
    ValueNotifier<bool> isShown,
    ValueNotifier<bool> isElementShown,
    ReferenceEntity<Timer> isShownTimer,
    ReferenceEntity<Timer> isElementShownTimer,
    VoidCallback onTimeout,
  ) {
    isShown.value = false;
    isElementShown.value = false;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      isShown.value = true;
      isElementShown.value = true;

      isShownTimer.value = Timer(SNACKBAR_AUTOMATIC_DISMISS_DURATION, () {
        isShown.value = false;

        isElementShownTimer.value = Timer(AnimationDuration.LONG, () {
          isElementShown.value = false;

          onTimeout();
        });
      });
    });
  }
}
