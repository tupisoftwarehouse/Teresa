import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/inherited_widgets/device_language_string_manager.dart"
    as device_language_string_manager_inherited_widget;
import "package:teresa/src/inherited_widgets/teresa_theme_manager.dart"
    as teresa_theme_manager_inherited_widget;
import "package:teresa/src/internals/managers/device_language_string_manager.dart";
import "package:teresa/src/internals/managers/teresa_theme_manager.dart";
import "package:teresa/src/internals/transaction_scripts/user_interface_handling/dropdown_menu_overlay_configuring_transaction_script.dart";
import "package:teresa/src/widgets/dropdown_menu/dropdown_menu_item.dart";

void main() {
  group("Test \"DropdownMenuOverlayConfiguringTransactionScript\" Class", () {
    late ValueNotifier<bool> isShown;

    setUpAll(() {
      isShown = ValueNotifier(false);
    });

    testWidgets(
      "Test If Method \"getConfiguredOverlay\" Returns Configured Dropdown Menu Overlay Entry",
      (tester) async {
        final layerLink = LayerLink();
        late final OverlayEntry configuredOverlayEntry;

        await tester.pumpWidget(
          device_language_string_manager_inherited_widget.DeviceLanguageStringManager<
            String
          >(
            deviceLanguageStringManager: DeviceLanguageStringManager<String>(
              CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
              (_) {},
            ),
            child: teresa_theme_manager_inherited_widget.TeresaThemeManager(
              teresaThemeManager: TeresaThemeManager(TERESA_THEME, (_) {}),
              child: Builder(
                builder: (context) {
                  configuredOverlayEntry =
                      DropdownMenuOverlayConfiguringTransactionScript.getConfiguredOverlayEntry<
                        String
                      >(
                        context,
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

                  return Placeholder();
                },
              ),
            ),
          ),
        );

        expect(configuredOverlayEntry, isA<OverlayEntry>());
      },
    );
  });
}
