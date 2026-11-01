import "package:flutter/widgets.dart" hide Orientation;
import "package:teresa/src/inherited_widgets/device_language_string_manager.dart";
import "package:teresa/src/inherited_widgets/device_language_strings.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/inherited_widgets/teresa_theme_manager.dart";
import "package:teresa/src/widgets/dropdown_menu/dropdown_menu_container.dart";
import "package:teresa/src/widgets/dropdown_menu/dropdown_menu_item.dart";

class DropdownMenuOverlayConfiguringTransactionScript {
  DropdownMenuOverlayConfiguringTransactionScript._();

  static OverlayEntry getConfiguredOverlayEntry<T>(
    BuildContext context,
    LayerLink layerLink,
    ValueNotifier<bool> isShown,
    List<DropdownMenuItem> items,
    double dropdownMenuWidth,
    VoidCallback removeMenuDropdownOverlayEntry,
  ) {
    final teresaTheme = TeresaThemeManager.of(context);
    final deviceLanguageStringManager = DeviceLanguageStringManager.of<T>(
      context,
    );

    return OverlayEntry(
      builder: (_) {
        return ValueListenableBuilder(
          valueListenable: deviceLanguageStringManager.deviceLanguageStrings,
          builder: (_, deviceLanguageStrings, _) {
            return ValueListenableBuilder(
              valueListenable: teresaTheme.theme,
              builder: (_, theme, _) {
                return DeviceLanguageStrings(
                  deviceLanguageStrings: deviceLanguageStrings,
                  child: TeresaTheme(
                    theme: theme,
                    child: DropdownMenuContainer(
                      layerLink: layerLink,
                      isShown: isShown,
                      items: items,
                      dropdownMenuWidth: dropdownMenuWidth,
                      removeMenuDropdownOverlayEntry:
                          removeMenuDropdownOverlayEntry,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
