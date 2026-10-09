import "dart:async";

import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/agnostic_widgets/tap_indicator.dart";
import "package:teresa/src/inherited_widgets/device_language_string_manager.dart"
    as device_language_string_manager_inherited_widget;
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/inherited_widgets/teresa_theme_manager.dart"
    as teresa_theme_manager_inherited_widget;
import "package:teresa/src/internals/managers/device_language_string_manager.dart";
import "package:teresa/src/internals/managers/teresa_theme_manager.dart";
import "package:teresa/src/internals/transaction_scripts/user_interface_handling/menu_dropdown_overlay_entry_removing_transaction_script.dart";
import "package:teresa/src/teresa_entities/reference_entity.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";
import "package:teresa/src/teresa_theme/icon_styles/header_icon.dart";
import "package:teresa/src/internals/transaction_scripts/user_interface_handling/dropdown_menu_overlay_configuring_transaction_script.dart";
import "package:teresa/src/teresa_theme/typography_styles/header_typography.dart";
import "package:teresa/src/widgets/dropdown_menu/dropdown_menu_item.dart";
import "package:teresa/src/widgets/widget_previewing_wrapper.dart";

/// Displays a themed dropdown menu that allows the user to select an item.
///
/// [T] represents the device-language string type used by the dropdown menu
/// and its underlying interaction logic.
///
/// [items] contains the options displayed in the dropdown menu.
///
/// [selectedItemAbbreviation] is the abbreviation of the currently selected
/// item displayed by the dropdown button.
///
/// [accessibilityLabel] provides the semantic label exposed to accessibility
/// services.
///
/// When tapped, the widget creates and displays its dropdown menu in an
/// overlay positioned relative to the dropdown button. The dropdown can be
/// dismissed through the back navigation system or by selecting an item.
///
/// The arrow icon rotates to indicate whether the menu is currently visible.
///
/// Example:
///
/// ```dart
/// DropdownMenu<DeviceLanguageStrings<String>>(
///   selectedItemAbbreviation: "BIN",
///   accessibilityLabel: "Select number base",
///   items: [
///     DropdownMenuItem(
///       label: "Binary",
///       abbreviation: "BIN",
///       isSelected: true,
///       accessibilityLabel: "Binary",
///       onTap: () {},
///     ),
///   ],
/// );
/// ```
class DropdownMenu<T> extends StatefulWidget {
  /// The items available for selection in the dropdown menu.
  final List<DropdownMenuItem> items;

  /// The abbreviation of the currently selected item.
  final String selectedItemAbbreviation;

  /// The accessibility label exposed for the dropdown menu.
  final String accessibilityLabel;

  /// Creates a dropdown menu with the given items and selected item
  /// abbreviation.
  const DropdownMenu({
    super.key,
    required this.items,
    required this.selectedItemAbbreviation,
    required this.accessibilityLabel,
  });

  @override
  State<DropdownMenu> createState() {
    return _DropdownMenuState<T>();
  }
}

class _DropdownMenuState<T> extends State<DropdownMenu> {
  final _isShown = ValueNotifier(false);
  final LayerLink _layerLink = LayerLink();
  late final ReferenceEntity<OverlayEntry?> _menuDropdownOverlayEntry;

  @override
  void initState() {
    super.initState();

    _menuDropdownOverlayEntry = ReferenceEntity();
  }

  @override
  void dispose() {
    super.dispose();

    MenuDropdownOverlayEntryRemovingTransactionScript.removeMenuDropdownOverlayEntry(
      _isShown,
      _menuDropdownOverlayEntry,
    );
  }

  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);

    return PopScope(
      onPopInvokedWithResult: (_, _) {
        MenuDropdownOverlayEntryRemovingTransactionScript.removeMenuDropdownOverlayEntry(
          _isShown,
          _menuDropdownOverlayEntry,
        );
      },
      child: Center(
        child: CompositedTransformTarget(
          link: _layerLink,
          child: GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Semantics(
                label: widget.accessibilityLabel,
                button: true,
                child: TapIndicator(
                  indicatorColor: teresaTheme.tapIndicatorColor,
                  onTap: () {
                    final dropdownMenuWidth =
                        (context.findRenderObject() as RenderBox).size.width;

                    _menuDropdownOverlayEntry.value =
                        DropdownMenuOverlayConfiguringTransactionScript.getConfiguredOverlayEntry<
                          T
                        >(
                          context,
                          _layerLink,
                          _isShown,
                          widget.items,
                          dropdownMenuWidth,
                          () {
                            late final Timer dropDownMenuRemovingTimer;

                            _isShown.value = false;

                            dropDownMenuRemovingTimer = Timer(
                              AnimationDuration.MEDIUM,
                              () {
                                _menuDropdownOverlayEntry.value?.remove();

                                _menuDropdownOverlayEntry.value = null;

                                dropDownMenuRemovingTimer.cancel();
                              },
                            );
                          },
                        );

                    Overlay.of(context)
                        .insert(_menuDropdownOverlayEntry.value!);

                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _isShown.value = true;
                    });
                  },
                  child: Container(
                    height: 56,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: teresaTheme.input.backgroundColor,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.selectedItemAbbreviation,
                            style: HeaderTypography.HEADING_4(
                              teresaTheme.iconEmphasis9Color,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: _isShown,
                          builder: (_, isShown, _) {
                            return AnimatedRotation(
                              duration: AnimationDuration.MEDIUM,
                              curve: Curves.easeInOutCirc,
                              turns: isShown ? 0.25 : 0.75,
                              child: HeaderIcon.HEADING_4(
                                Symbols.arrow_back_ios_new_rounded,
                                teresaTheme.iconEmphasis9Color,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

@Preview()
Widget preview() {
  final itemLabel = "Binary";
  final itemAbbreviation = "BIN";

  return WidgetPreviewingWrapper(
    child:
        device_language_string_manager_inherited_widget.DeviceLanguageStringManager(
          deviceLanguageStringManager: DeviceLanguageStringManager(
            CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
            (_) {},
          ),
          child: teresa_theme_manager_inherited_widget.TeresaThemeManager(
            teresaThemeManager: TeresaThemeManager(TERESA_THEME, (_) {}),
            child: DropdownMenu<String>(
              selectedItemAbbreviation: itemAbbreviation,
              accessibilityLabel: "",
              items: [
                DropdownMenuItem(
                  label: itemLabel,
                  abbreviation: itemAbbreviation,
                  isSelected: true,
                  accessibilityLabel: "",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
  );
}
