import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart" as widgets;
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/orientation/orientation.dart";
import "package:teresa/src/teresa_theme/typography_styles/label_typography.dart";
import "package:teresa/src/widgets/divider.dart";
import "package:teresa/src/widgets/segmented_button/segmented_button_item.dart";
import "package:teresa/src/widgets/widget_previewing_wrapper.dart";

/// Displays a labeled, horizontally scrollable group of selectable options.
///
/// [label] describes the group, and [items] defines the options displayed in
/// it. A divider is automatically inserted between adjacent items.
///
/// Each item's [SegmentedButtonItem.isSelected] value controls its selected
/// appearance. Update that value in response to an item's tap callback to keep
/// the displayed selection in sync with the application's state.
///
/// The segmented button uses the current [TeresaTheme] for its label and
/// divider colors.
///
/// Example:
///
/// ```dart
/// SegmentedButton(
///   label: "Color mode",
///   items: [
///     SegmentedButtonItem(
///       title: "HEX",
///       isSelected: true,
///       accessibilityLabel: "Hexadecimal color mode",
///       onTapped: () {},
///     ),
///     SegmentedButtonItem(
///       title: "RGB",
///       isSelected: false,
///       accessibilityLabel: "RGB color mode",
///       onTapped: () {},
///     ),
///   ],
/// );
/// ```
class SegmentedButton extends widgets.StatelessWidget {
  /// The label displayed above the options.
  final String label;

  /// The selectable options displayed in the segmented button.
  final List<SegmentedButtonItem> items;

  /// Creates a labeled segmented button containing the given [items].
  const SegmentedButton({super.key, required this.label, required this.items});

  @override
  widgets.Widget build(widgets.BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);
    final itemsWithDividers = items.expand((item) {
      return [
        item,
        Divider(
          color: teresaTheme.borderedSurface.borderColor,
          orientation: Orientation.VERTICAL,
        ),
      ];
    }).toList()..removeLast();

    return widgets.SizedBox(
      height: 78,
      child: widgets.Column(
        crossAxisAlignment: widgets.CrossAxisAlignment.start,
        spacing: 7,
        children: [
          widgets.Padding(
            padding: const widgets.EdgeInsetsGeometry.only(left: 14),
            child: widgets.Text(
              "$label:",
              style: LabelTypography.SEMIBOLD_14(
                teresaTheme.textEmphasis4Color,
              ),
            ),
          ),
          widgets.SingleChildScrollView(
            scrollDirection: widgets.Axis.horizontal,
            padding: const widgets.EdgeInsets.symmetric(
              vertical: 1,
              horizontal: 2,
            ),
            child: widgets.Container(
              height: 48,
              decoration: widgets.BoxDecoration(
                border: widgets.Border.all(
                  width: 1,
                  color: teresaTheme.borderedSurface.borderColor,
                  strokeAlign: widgets.BorderSide.strokeAlignOutside,
                ),
                borderRadius: widgets.BorderRadius.circular(1000),
              ),
              clipBehavior: widgets.Clip.hardEdge,
              child: widgets.Row(
                mainAxisSize: widgets.MainAxisSize.min,
                children: itemsWithDividers,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

@Preview()
widgets.Widget preview() {
  return WidgetPreviewingWrapper(
    child: SegmentedButton(
      label: "Color mode",
      items: [
        SegmentedButtonItem(
          title: "HEX",
          isSelected: true,
          accessibilityLabel: "",
          onTapped: () {},
        ),
        SegmentedButtonItem(
          title: "RGB",
          isSelected: false,
          accessibilityLabel: "",
          onTapped: () {},
        ),
      ],
    ),
  );
}
