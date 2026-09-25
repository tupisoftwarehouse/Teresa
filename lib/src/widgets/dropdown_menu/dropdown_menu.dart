import "dart:async";

import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/agnostic_widgets/tap_indicator.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";
import "package:teresa/src/teresa_theme/icon_styles/header_icon.dart";
import "package:teresa/src/internals/transaction_scripts/user_interface_handling/dropdown_menu_overlay_configuring_transaction_script.dart";
import "package:teresa/src/teresa_theme/typography_styles/header_typography.dart";
import "package:teresa/src/widgets/dropdown_menu/dropdown_menu_item.dart";

/// Displays a themed dropdown menu that allows the user to select an item.
///
/// [items] contains the options displayed in the dropdown menu.
/// [selectedItemAbbreviation] is the abbreviation of the currently selected
/// item displayed by the dropdown button.
/// [accessibilityLabel] provides the semantic label exposed to accessibility
/// services.
///
/// When tapped, the widget creates and displays its dropdown menu in an
/// overlay positioned relative to the dropdown button. The dropdown can be
/// dismissed through the back navigation system or by selecting an item.
/// The arrow icon rotates to indicate whether the menu is currently visible.
///
/// Example:
///
/// ```dart
/// DropdownMenu(
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
class DropdownMenu extends StatefulWidget {
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
    return _DropdownMenuState();
  }
}

class _DropdownMenuState extends State<DropdownMenu> {
  final _isShown = ValueNotifier(false);
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _menuDropdownOverlayEntry;

  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);

    return PopScope(
      onPopInvokedWithResult: (_, _) {
        if (_isShown.value) {
          _isShown.value = false;

          _menuDropdownOverlayEntry?.remove();

          _menuDropdownOverlayEntry = null;
        }
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

                    _menuDropdownOverlayEntry =
                        DropdownMenuOverlayConfiguringTransactionScript.getConfiguredOverlayEntry(
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
                                _menuDropdownOverlayEntry?.remove();

                                _menuDropdownOverlayEntry = null;

                                dropDownMenuRemovingTimer.cancel();
                              },
                            );
                          },
                        );

                    Overlay.of(context).insert(_menuDropdownOverlayEntry!);

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

  return SizedBox(
    width: WIDGET_PREVIEW_MAXIMUM_SIZE,
    child: DropdownMenu(
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
  );
}
