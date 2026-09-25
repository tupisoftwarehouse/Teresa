import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart" hide Orientation;
import "package:teresa/src/agnostic_widgets/surface.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";
import "package:teresa/src/widgets/divider.dart";
import "package:teresa/src/widgets/dropdown_menu/dropdown_menu_item.dart";
import "package:teresa/src/orientation/orientation.dart";

/// Displays the overlay container that holds the items of a [DropdownMenu].
///
/// [layerLink] connects the container to the dropdown menu button so the
/// container can be positioned relative to it.
/// [isShown] controls whether the dropdown container is expanded or collapsed.
/// [items] contains the [DropdownMenuItem] widgets displayed in the menu.
/// [dropdownMenuWidth] defines the width of the dropdown menu.
/// [removeMenuDropdownOverlayEntry] is called when the dropdown should be
/// dismissed.
///
/// The container displays dividers between adjacent items, limits the menu
/// height to 168 pixels, and automatically scrolls toward the currently
/// selected item.
///
/// Example:
///
/// ```dart
/// DropdownMenuContainer(
///   layerLink: LayerLink(),
///   isShown: ValueNotifier(true),
///   items: [
///     DropdownMenuItem(
///       label: "Binary",
///       abbreviation: "BIN",
///       isSelected: true,
///       accessibilityLabel: "Binary",
///       onTap: () {},
///     ),
///   ],
///   dropdownMenuWidth: 200,
///   removeMenuDropdownOverlayEntry: () {},
/// );
/// ```
class DropdownMenuContainer extends StatefulWidget {
  /// Connects the dropdown container to the widget that controls its position.
  final LayerLink layerLink;

  /// Controls whether the dropdown menu is expanded or collapsed.
  final ValueNotifier<bool> isShown;

  /// The items displayed inside the dropdown menu.
  final List<DropdownMenuItem> items;

  /// The width of the dropdown menu.
  final double dropdownMenuWidth;

  /// Called when the dropdown menu should be dismissed.
  final VoidCallback removeMenuDropdownOverlayEntry;

  /// Creates a dropdown menu container with the given positioning, visibility,
  /// items, width, and dismissal callback.
  const DropdownMenuContainer({
    super.key,
    required this.layerLink,
    required this.isShown,
    required this.items,
    required this.dropdownMenuWidth,
    required this.removeMenuDropdownOverlayEntry,
  });

  @override
  State<StatefulWidget> createState() {
    return _DropdownMenuContainerState();
  }
}

class _DropdownMenuContainerState extends State<DropdownMenuContainer> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);
    final itemsWithDividers =
        widget.items.indexed
            .map((item) {
              final dropdownMenuContainerIndex = item.$1;
              final dropdownMenuContainerWidget = item.$2;

              if (dropdownMenuContainerWidget.isSelected) {
                _scrollController = ScrollController(
                  initialScrollOffset: dropdownMenuContainerIndex * 48 - 56,
                );
              }

              return DropdownMenuItem(
                label: dropdownMenuContainerWidget.label,
                abbreviation: dropdownMenuContainerWidget.abbreviation,
                isSelected: dropdownMenuContainerWidget.isSelected,
                accessibilityLabel:
                    dropdownMenuContainerWidget.accessibilityLabel,
                onTap: () {
                  dropdownMenuContainerWidget.onTap();

                  widget.isShown.value = false;

                  widget.removeMenuDropdownOverlayEntry();
                },
              );
            })
            .expand((element) {
              return [
                element,
                Divider(
                  color: teresaTheme.elevatedSurface.borderColor,
                  orientation: Orientation.HORIZONTAL,
                ),
              ];
            })
            .toList()
          ..removeLast();

    return Positioned.fill(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.removeMenuDropdownOverlayEntry,
        child: Stack(
          children: [
            CompositedTransformFollower(
              link: widget.layerLink,
              offset: const Offset(0, 68),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: ValueListenableBuilder(
                  valueListenable: widget.isShown,
                  builder: (_, isShownValue, _) {
                    return AnimatedContainer(
                      height: isShownValue ? widget.items.length * 48 : 0,
                      constraints: const BoxConstraints(maxHeight: 168),
                      width: widget.dropdownMenuWidth,
                      duration: AnimationDuration.MEDIUM,
                      curve: Curves.easeInOutCirc,
                      child: Surface(
                        height: double.infinity,
                        width: double.infinity,
                        backgroundColor: teresaTheme.input.backgroundColor,
                        borderColor: teresaTheme.elevatedSurface.borderColor,
                        borderRadius: BorderRadius.circular(13),
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: itemsWithDividers,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

@Preview()
Widget preview() {
  return DropdownMenuContainer(
    layerLink: LayerLink(),
    isShown: ValueNotifier(true),
    items: [
      DropdownMenuItem(
        label: "Binary",
        abbreviation: "BIN",
        isSelected: true,
        accessibilityLabel: "",
        onTap: () {},
      ),
    ],
    dropdownMenuWidth: 200,
    removeMenuDropdownOverlayEntry: () {},
  );
}
