import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/internals/transaction_scripts/user_interface_handling/menu_dropdown_overlay_entry_removing_transaction_script.dart";
import "package:teresa/src/teresa_entities/reference_entity.dart";
import "package:teresa/teresa.dart";

void main() {
  group("Test \"MenuDropdownOverlayEntryRemovingTransactionScript\" Class", () {
    late ValueNotifier<bool> isShown;
    late ReferenceEntity<OverlayEntry?> menuDropdownOverlayEntry;

    setUp(() {
      isShown = ValueNotifier(true);

      menuDropdownOverlayEntry = ReferenceEntity();

      menuDropdownOverlayEntry.value = OverlayEntry(
        builder: (_) {
          return Placeholder();
        },
      );
    });

    testWidgets(
      "Test If Method \"removeMenuDropdownOverlayEntry\" Removes Menu Dropdown Overlay Entry If It Is Shown",
      (tester) async {
        await tester.pumpWidget(
          WidgetTestingWrapper(
            child: Overlay(initialEntries: [menuDropdownOverlayEntry.value!]),
          ),
        );

        MenuDropdownOverlayEntryRemovingTransactionScript.removeMenuDropdownOverlayEntry(
          isShown,
          menuDropdownOverlayEntry,
        );

        expect(isShown.value, false);
        expect(menuDropdownOverlayEntry.value, null);
      },
    );
  });
}
