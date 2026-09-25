import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/agnostic_widgets/tap_indicator.dart";
import "package:teresa/src/agnostic_widgets/tooltip.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";

/// Displays a compact circular button for contextual actions.
///
/// [icon] identifies the action represented by the button.
/// [color] defines the color of the button's icon.
/// [tapIndicatorColor] defines the color of the visual tap feedback.
/// [tooltipMessage] is displayed when the user requests the button's tooltip.
/// [accessibilityLabel] provides the semantic label exposed to accessibility
/// services.
/// [onTap] is called when the button is tapped.
///
/// The button uses haptic feedback and a circular shape to provide a compact
/// control suitable for contextual actions.
///
/// Example:
///
/// ```dart
/// ContextButton(
///   icon: Symbols.delete_rounded,
///   color: NEUTRALS_50,
///   tapIndicatorColor: NEUTRALS_50,
///   tooltipMessage: "Clear history",
///   accessibilityLabel: "Clear history",
///   onTap: () {
///     // Clear the history.
///   },
/// );
/// ```
class ContextButton extends StatelessWidget {
  /// The icon displayed by the button.
  final IconData icon;

  /// The color used to display the icon.
  final Color color;

  /// The color used for the button's tap feedback.
  final Color tapIndicatorColor;

  /// The tooltip message displayed for the button.
  final String tooltipMessage;

  /// The accessibility label exposed for the button.
  final String accessibilityLabel;

  /// Called when the button is tapped.
  final VoidCallback onTap;

  /// Creates a contextual action button with the given icon, colors, tooltip,
  /// accessibility label, and tap callback.
  const ContextButton({
    super.key,
    required this.icon,
    required this.color,
    required this.tapIndicatorColor,
    required this.tooltipMessage,
    required this.accessibilityLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: accessibilityLabel,
      button: true,
      child: Tooltip(
        message: tooltipMessage,
        verticalDisplacement: 32,
        child: SizedBox(
          height: 48,
          width: 48,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: TapIndicator(
              indicatorColor: tapIndicatorColor,
              isHapticFeedbackEnabled: true,
              onTap: onTap,
              child: Center(
                child: Icon(
                  icon,
                  size: 24,
                  color: color,
                  fill: 1,
                  weight: FontWeight.w400.value.toDouble(),
                  fontWeight: FontWeight.w400,
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
  return ContextButton(
    icon: Symbols.delete_rounded,
    color: NeutralColor.VALUE_50,
    tapIndicatorColor: NeutralColor.VALUE_50,
    tooltipMessage: "Clear history",
    accessibilityLabel: "",
    onTap: () {},
  );
}
