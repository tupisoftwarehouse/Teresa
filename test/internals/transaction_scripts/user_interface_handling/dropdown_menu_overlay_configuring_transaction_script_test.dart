import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/internals/transaction_scripts/user_interface_handling/dropdown_menu_overlay_configuring_transaction_script.dart";
import "package:teresa/src/widgets/dropdown_menu/dropdown_menu_item.dart";

void main() {
  group("Test \"DropdownMenuOverlayConfiguringTransactionScript\" Class", () {
    late ValueNotifier<bool> isShown;

    setUpAll(() {
      isShown = ValueNotifier(false);
    });

    test("Test If Method \"getConfiguredOverlay\" Returns Configured Dropdown Menu Overlay Entry", () {
      final layerLink = LayerLink();
      final configuredOverlayEntry =
          DropdownMenuOverlayConfiguringTransactionScript.getConfiguredOverlayEntry(
            layerLink,
            isShown,
            [
              DropdownMenuItem(
                label: WIDGET_PRIMARY_TEXT,
                abbreviation: WIDGET_SECONDARY_TEXT,
                isSelected: true,
                accessibilityLabel: WIDGET_ACCESSIBILITY_LABEL,
                onTap: () {},
              ),
            ],
            DROPDOWN_MENU_WIDTH,
            () {},
          );

      expect(configuredOverlayEntry, isA<OverlayEntry>());
    });
  });
}
