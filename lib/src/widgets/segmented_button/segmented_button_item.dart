import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";
import "package:teresa/src/agnostic_widgets/tap_indicator.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";
import "package:teresa/src/teresa_theme/colors/primary_color.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";
import "package:teresa/src/teresa_theme/icon_styles/label_icon.dart";
import "package:teresa/src/teresa_theme/typography_styles/label_typography.dart";
import "package:teresa/src/widgets/widget_previewing_wrapper.dart";

/// Displays an individual selectable option inside a [SegmentedButton].
///
/// [title] is the text displayed for the option. [isSelected] controls its
/// selected appearance, including a check icon. [accessibilityLabel] provides
/// the semantic label exposed to accessibility services, and [onTapped] is
/// called when the option is tapped.
///
/// The selected state is supplied by the parent; update [isSelected] when
/// handling [onTapped] to reflect changes to the selection.
///
/// Example:
///
/// ```dart
/// SegmentedButtonItem(
///   title: "HEX",
///   isSelected: true,
///   accessibilityLabel: "Hexadecimal color mode",
///   onTapped: () {
///     // Select hexadecimal color mode.
///   },
/// );
/// ```
class SegmentedButtonItem extends StatefulWidget {
  /// The text displayed for the option.
  final String title;

  /// Whether this option is currently selected.
  final bool isSelected;

  /// The accessibility label exposed for the option.
  final String accessibilityLabel;

  /// Called when the option is tapped.
  final VoidCallback onTapped;

  /// Creates a selectable option with the given title, selection state,
  /// accessibility label, and tap callback.
  const SegmentedButtonItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.accessibilityLabel,
    required this.onTapped,
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
      child: AnimatedContainer(
        color: widget.isSelected
            ? PrimaryColor.VALUE_200
            : teresaTheme.surface.backgroundColor,
        alignment: AlignmentGeometry.center,
        duration: AnimationDuration.SHORT,
        curve: Curves.easeInOutCirc,
        child: TapIndicator(
          indicatorColor: widget.isSelected
              ? NeutralColor.VALUE_900
              : teresaTheme.tapIndicatorColor,
          isHapticFeedbackEnabled: true,
          onTapped: widget.onTapped,
          child: Container(
            constraints: const BoxConstraints(minHeight: 48, maxHeight: 48),
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Row(
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
                                widget.isSelected
                                    ? NeutralColor.VALUE_900
                                    : teresaTheme.iconEmphasis9Color,
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
                      widget.isSelected
                          ? NeutralColor.VALUE_900
                          : teresaTheme.textEmphasis9Color,
                    ),
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
  return WidgetPreviewingWrapper(
    child: SegmentedButtonItem(
      title: "RGB",
      isSelected: false,
      accessibilityLabel: "",
      onTapped: () {},
    ),
  );
}
