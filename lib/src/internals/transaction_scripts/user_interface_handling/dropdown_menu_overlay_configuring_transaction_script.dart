import "package:flutter/widgets.dart" hide Orientation;
import "package:teresa/src/widgets/dropdown_menu/dropdown_menu_container.dart";
import "package:teresa/src/widgets/dropdown_menu/dropdown_menu_item.dart";

class DropdownMenuOverlayConfiguringTransactionScript {
  DropdownMenuOverlayConfiguringTransactionScript._();

  static OverlayEntry getConfiguredOverlayEntry(
    LayerLink layerLink,
    ValueNotifier<bool> isShown,
    List<DropdownMenuItem> items,
    double dropdownMenuWidth,
    VoidCallback removeMenuDropdownOverlayEntry,
  ) {
    return OverlayEntry(
      builder: (_) {
        return DropdownMenuContainer(
          layerLink: layerLink,
          isShown: isShown,
          items: items,
          dropdownMenuWidth: dropdownMenuWidth,
          removeMenuDropdownOverlayEntry: removeMenuDropdownOverlayEntry,
        );
      },
    );
  }
}
