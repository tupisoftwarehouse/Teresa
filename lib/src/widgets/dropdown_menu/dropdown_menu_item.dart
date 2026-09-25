import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/agnostic_widgets/tap_indicator.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";
import "package:teresa/src/teresa_theme/colors/primary_color.dart";
import "package:teresa/src/teresa_theme/typography_styles/header_typography.dart";
import "package:teresa/src/teresa_theme/typography_styles/label_typography.dart";

/// Displays an individual option inside a [DropdownMenu].
///
/// [label] is the primary text displayed for the item.
/// [abbreviation] is the secondary text displayed below the label.
/// [isSelected] determines whether the item is displayed as selected.
/// [accessibilityLabel] provides the semantic label exposed to accessibility
/// services.
/// [onTap] is called when the item is tapped.
///
/// Selected items use Teresa's primary color palette, while unselected items
/// use the current [TeresaTheme] input and text colors.
///
/// Example:
///
/// ```dart
/// DropdownMenuItem(
///   label: "Binary",
///   abbreviation: "BIN",
///   isSelected: true,
///   accessibilityLabel: "Binary",
///   onTap: () {
///     // Select the item.
///   },
/// );
/// ```
class DropdownMenuItem extends StatefulWidget {
  /// The primary text displayed for the item.
  final String label;

  /// The abbreviated text displayed below the [label].
  final String abbreviation;

  /// Whether this item is currently selected.
  final bool isSelected;

  /// The accessibility label exposed for the item.
  final String accessibilityLabel;

  /// Called when the item is tapped.
  final VoidCallback onTap;

  /// Creates a dropdown menu item with the given label, abbreviation, selected
  /// state, accessibility label, and tap callback.
  const DropdownMenuItem({
    super.key,
    required this.label,
    required this.abbreviation,
    required this.isSelected,
    required this.accessibilityLabel,
    required this.onTap,
  });

  @override
  State<DropdownMenuItem> createState() {
    return _DropdownMenuItemState();
  }
}

class _DropdownMenuItemState extends State<DropdownMenuItem> {
  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);

    return Semantics(
      label: widget.accessibilityLabel,
      button: true,
      selected: widget.isSelected,
      child: TapIndicator(
        indicatorColor: widget.isSelected
            ? NeutralColor.VALUE_900
            : teresaTheme.tapIndicatorColor,
        onTap: widget.onTap,
        child: Container(
          height: 48,
          width: double.infinity,
          color: widget.isSelected
              ? PrimaryColor.VALUE_200
              : teresaTheme.input.backgroundColor,
          child: Padding(
            padding: const EdgeInsetsGeometry.symmetric(
              vertical: 0,
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectionContainer.disabled(
                  child: Text(
                    widget.label,
                    style: HeaderTypography.HEADING_5(
                      widget.isSelected
                          ? NeutralColor.VALUE_900
                          : teresaTheme.textEmphasis9Color,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SelectionContainer.disabled(
                  child: Text(
                    widget.abbreviation,
                    style: LabelTypography.SEMIBOLD_12(
                      widget.isSelected
                          ? NeutralColor.VALUE_500
                          : teresaTheme.textEmphasis5Color,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

@Preview()
Widget preview() {
  return SizedBox(
    width: WIDGET_PREVIEW_MAXIMUM_SIZE,
    child: DropdownMenuItem(
      label: "Binary",
      abbreviation: "BIN",
      isSelected: true,
      accessibilityLabel: "",
      onTap: () {},
    ),
  );
}
