import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:teresa/src/agnostic_widgets/tap_indicator.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/agnostic_widgets/tooltip.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";
import "package:teresa/src/teresa_theme/colors/primary_color.dart";
import "package:teresa/src/teresa_theme/colors/secondary_color.dart";

/// Displays a circular checkbox with an animated checked state.
///
/// [isChecked] determines whether the checkbox is displayed as selected.
/// [tooltipMessage] is displayed when the user requests the checkbox's
/// tooltip.
/// [accessibilityLabel] provides the semantic label exposed to accessibility
/// services.
/// [onTap] is called when the checkbox is tapped.
///
/// The checkbox uses the current [TeresaTheme] for its unchecked background
/// and tap indicator color. Its checked state is represented by an animated
/// secondary-colored outer circle with a primary-colored inner circle.
///
/// Example:
///
/// ```dart
/// Checkbox(
///   isChecked: true,
///   tooltipMessage: "Select Kilogram as base",
///   accessibilityLabel: "Kilogram",
///   onTap: () {
///     // Toggle the selection.
///   },
/// );
/// ```
class Checkbox extends StatefulWidget {
  /// Whether the checkbox is currently checked.
  final bool isChecked;

  /// The tooltip message displayed for the checkbox.
  final String tooltipMessage;

  /// The accessibility label exposed for the checkbox.
  final String accessibilityLabel;

  /// Called when the checkbox is tapped.
  final VoidCallback onTap;

  /// Creates a checkbox with the given checked state, tooltip, accessibility
  /// label, and tap callback.
  const Checkbox({
    super.key,
    required this.isChecked,
    required this.tooltipMessage,
    required this.accessibilityLabel,
    required this.onTap,
  });

  @override
  State<StatefulWidget> createState() {
    return _CheckboxState();
  }
}

class _CheckboxState extends State<Checkbox> {
  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);

    return Semantics(
      label: widget.accessibilityLabel,
      button: true,
      child: Tooltip(
        message: widget.tooltipMessage,
        verticalDisplacement: 32,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(1000),
          child: TapIndicator(
            indicatorColor: teresaTheme.tapIndicatorColor,
            isHapticFeedbackEnabled: true,
            onTap: widget.onTap,
            child: Stack(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    color: teresaTheme.input.backgroundColor,
                  ),
                ),
                AnimatedScale(
                  scale: widget.isChecked ? 1.0 : 0.0,
                  duration: AnimationDuration.SHORT,
                  curve: Curves.easeInOutCirc,
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      color: SecondaryColor.VALUE_900,
                    ),
                    child: Center(
                      child: AnimatedScale(
                        scale: widget.isChecked ? 1.0 : 0.0,
                        duration: AnimationDuration.SHORT,
                        curve: Curves.easeInOutCirc,
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            color: PrimaryColor.VALUE_500,
                          ),
                        ),
                      ),
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
  return Checkbox(
    isChecked: false,
    accessibilityLabel: "",
    tooltipMessage: "Select Kilogram as base",
    onTap: () {},
  );
}
