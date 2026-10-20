import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart" as widgets;
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/orientation/orientation.dart";
import "package:teresa/src/teresa_theme/typography_styles/label_typography.dart";
import "package:teresa/src/widgets/divider.dart";
import "package:teresa/src/widgets/segmented_button/segmented_button_item.dart";
import "package:teresa/src/widgets/widget_previewing_wrapper.dart";

class SegmentedButton extends widgets.StatelessWidget {
  final String label;
  final List<SegmentedButtonItem> items;

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
                teresaTheme.textEmphasis3Color,
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
          onTap: () {},
        ),
        SegmentedButtonItem(
          title: "RGB",
          isSelected: false,
          accessibilityLabel: "",
          onTap: () {},
        ),
      ],
    ),
  );
}
