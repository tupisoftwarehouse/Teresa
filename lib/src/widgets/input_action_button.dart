import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/agnostic_widgets/surface.dart";
import "package:teresa/src/agnostic_widgets/tap_indicator.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/agnostic_widgets/tooltip.dart";

/// Displays a circular action button intended for actions associated with
/// input fields.
///
/// [icon] identifies the action represented by the button.
/// [tooltipMessage] is displayed when the user requests the button's tooltip.
/// [accessibilityLabel] provides the semantic label exposed to accessibility
/// services.
/// [onTap] is called when the button is tapped.
///
/// The button uses Teresa's elevated surface and tap indicator styles and
/// provides haptic feedback when tapped.
///
/// Example:
///
/// ```dart
/// InputActionButton(
///   icon: Symbols.add_rounded,
///   tooltipMessage: "Add time",
///   accessibilityLabel: "Add time",
///   onTap: () {
///     // Add the requested value.
///   },
/// );
/// ```
class InputActionButton extends StatefulWidget {
  /// The icon displayed by the action button.
  final IconData icon;

  /// The tooltip message displayed for the action button.
  final String tooltipMessage;

  /// The accessibility label exposed for the action button.
  final String accessibilityLabel;

  /// Called when the action button is tapped.
  final VoidCallback onTap;

  /// Creates an input action button with the given icon, tooltip, accessibility
  /// label, and tap callback.
  const InputActionButton({
    super.key,
    required this.icon,
    required this.tooltipMessage,
    required this.accessibilityLabel,
    required this.onTap,
  });

  @override
  State<StatefulWidget> createState() {
    return _InputActionButtonState();
  }
}

class _InputActionButtonState extends State<InputActionButton> {
  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);

    return Semantics(
      label: widget.accessibilityLabel,
      button: true,
      child: Tooltip(
        message: widget.tooltipMessage,
        verticalDisplacement: 36,
        child: Surface(
          backgroundColor: teresaTheme.elevatedSurface.backgroundColor,
          borderColor: teresaTheme.elevatedSurface.borderColor,
          borderRadius: BorderRadius.circular(1000),
          height: 56,
          width: 56,
          child: TapIndicator(
            indicatorColor: teresaTheme.tapIndicatorColor,
            isHapticFeedbackEnabled: true,
            onTap: widget.onTap,
            child: Center(
              child: Icon(
                widget.icon,
                size: 18,
                color: teresaTheme.iconEmphasis9Color,
                fill: 1,
                weight: FontWeight.w900.value.toDouble(),
                fontWeight: FontWeight.w900,
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
  return InputActionButton(
    icon: Symbols.add_rounded,
    tooltipMessage: "Add time",
    accessibilityLabel: "",
    onTap: () {},
  );
}
