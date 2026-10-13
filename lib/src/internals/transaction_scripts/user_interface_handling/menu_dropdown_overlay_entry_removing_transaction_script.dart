import "package:flutter/widgets.dart";
import "package:teresa/src/teresa_entities/reference_entity.dart";

class MenuDropdownOverlayEntryRemovingTransactionScript {
  MenuDropdownOverlayEntryRemovingTransactionScript._();

  static void removeMenuDropdownOverlayEntry(
    ValueNotifier<bool> isShown,
    ReferenceEntity<OverlayEntry?> menuDropdownOverlayEntry,
  ) {
    if (isShown.value) {
      isShown.value = false;

      menuDropdownOverlayEntry.value?.remove();

      menuDropdownOverlayEntry.value = null;
    }
  }
}
