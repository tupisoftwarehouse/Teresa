import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";
import "package:teresa/src/agnostic_widgets/tap_indicator.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";
import "package:teresa/src/teresa_theme/colors/primary_color.dart";
import "package:teresa/src/teresa_theme/icon_styles/label_icon.dart";
import "package:teresa/src/teresa_theme/typography_styles/label_typography.dart";
import "package:teresa/src/widgets/widget_previewing_wrapper.dart";

class SegmentedButtonItem extends StatefulWidget {
  final String title;
  final bool isSelected;
  final String accessibilityLabel;
  final VoidCallback onTap;

  const SegmentedButtonItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.accessibilityLabel,
    required this.onTap,
  });

  @override
  State<StatefulWidget> createState() {
    return _SegmentedButtonItemState();
  }
}

class _SegmentedButtonItemState extends State<SegmentedButtonItem> {
  late final ValueNotifier<bool> _isSelectedIndicatorShown;

  @override
  void initState() {
    super.initState();

    _isSelectedIndicatorShown = ValueNotifier(widget.isSelected);
  }

  @override
  void didUpdateWidget(SegmentedButtonItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isSelected && !_isSelectedIndicatorShown.value) {
      _isSelectedIndicatorShown.value = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);

    return Semantics(
      label: widget.accessibilityLabel,
      child: TapIndicator(
        indicatorColor: teresaTheme.tapIndicatorColor,
        onTap: widget.onTap,
        child: AnimatedContainer(
          constraints: const BoxConstraints(minHeight: 48, maxHeight: 48),
          color: widget.isSelected
              ? PrimaryColor.VALUE_200
              : teresaTheme.surface.backgroundColor,
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
          alignment: AlignmentGeometry.center,
          duration: AnimationDuration.SHORT,
          curve: Curves.easeInOutCirc,
          child: Row(
            spacing: 4,
            children: [
              ValueListenableBuilder(
                valueListenable: _isSelectedIndicatorShown,
                builder: (_, isSelectedIndicatorShown, _) {
                  return isSelectedIndicatorShown
                      ? AnimatedContainer(
                          height: widget.isSelected ? 24 : 0,
                          width: widget.isSelected ? 24 : 0,
                          duration: AnimationDuration.SHORT,
                          curve: Curves.easeInOutCirc,
                          onEnd: () {
                            if (!widget.isSelected) {
                              _isSelectedIndicatorShown.value = false;
                            }
                          },
                          child: AnimatedScale(
                            scale: widget.isSelected ? 1 : 0,
                            duration: AnimationDuration.SHORT,
                            curve: Curves.easeInOutCirc,
                            child: LabelIcon.BOLD_16(
                              Symbols.check_rounded,
                              teresaTheme.iconEmphasis9Color,
                            ),
                          ),
                        )
                      : const SizedBox.shrink();
                },
              ),
              AnimatedOpacity(
                opacity: widget.isSelected ? 1 : 0.3,
                duration: AnimationDuration.SHORT,
                curve: Curves.easeInOutCirc,
                child: Text(
                  widget.title,
                  style: LabelTypography.BOLD_16(
                    teresaTheme.iconEmphasis9Color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@Preview()
Widget preview() {
  return WidgetPreviewingWrapper(
    child: SegmentedButtonItem(
      title: "RGB",
      isSelected: false,
      accessibilityLabel: "",
      onTap: () {},
    ),
  );
}
