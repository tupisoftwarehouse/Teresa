import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/agnostic_widgets/surface.dart";
import "package:teresa/src/agnostic_widgets/tap_indicator.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/agnostic_widgets/tooltip.dart";

/// Displays a circular action button with customizable colors and feedback.
///
/// [icon] identifies the action represented by the button.
/// [backgroundColor] optionally overrides the button's background color.
/// [borderColor] optionally overrides the button's border color.
/// [iconColor] optionally overrides the icon color.
/// [indicatorColor] optionally overrides the tap indicator color.
/// [tooltipMessage] is displayed when the user requests the button's tooltip.
/// [accessibilityLabel] provides the semantic label exposed to accessibility
/// services.
/// [isHapticFeedbackEnabled] determines whether haptic feedback is triggered
/// when the button is tapped.
/// [onTap] is called when the button is tapped.
///
/// When color overrides are not provided, the button uses the corresponding
/// values from the current [TeresaTheme].
///
/// Example:
///
/// ```dart
/// ActionButton(
///   icon: Symbols.arrow_back_ios_new_rounded,
///   tooltipMessage: "Go back",
///   accessibilityLabel: "Go back",
///   onTap: () {
///     // Navigate back.
///   },
/// );
/// ```
class ActionButton extends StatefulWidget {
  /// The icon displayed by the action button.
  final IconData icon;

  /// An optional background color for the button.
  ///
  /// When `null`, the elevated surface background color from [TeresaTheme]
  /// is used.
  final Color? backgroundColor;

  /// An optional border color for the button.
  ///
  /// When `null`, the elevated surface border color from [TeresaTheme] is used.
  final Color? borderColor;

  /// An optional color for the button's icon.
  ///
  /// When `null`, the icon emphasis color from [TeresaTheme] is used.
  final Color? iconColor;

  /// An optional color for the button's tap indicator.
  ///
  /// When `null`, the tap indicator color from [TeresaTheme] is used.
  final Color? indicatorColor;

  /// The tooltip message displayed for the action button.
  final String tooltipMessage;

  /// The accessibility label exposed for the action button.
  final String accessibilityLabel;

  /// Whether haptic feedback is triggered when the button is tapped.
  ///
  /// Defaults to `true`.
  final bool isHapticFeedbackEnabled;

  /// Called when the action button is tapped.
  final VoidCallback onTap;

  /// Creates a circular action button with optional color overrides.
  const ActionButton({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.borderColor,
    this.iconColor,
    this.indicatorColor,
    required this.tooltipMessage,
    required this.accessibilityLabel,
    this.isHapticFeedbackEnabled = true,
    required this.onTap,
  });

  @override
  State<StatefulWidget> createState() {
    return _ActionButtonState();
  }
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);

    return Semantics(
      label: widget.accessibilityLabel,
      button: true,
      child: Tooltip(
        message: widget.tooltipMessage,
        verticalDisplacement: 40,
        child: Surface(
          backgroundColor:
              widget.backgroundColor ??
              teresaTheme.elevatedSurface.backgroundColor,
          borderColor:
              widget.borderColor ?? teresaTheme.elevatedSurface.borderColor,
          borderRadius: BorderRadius.circular(1000),
          height: 64,
          width: 64,
          child: TapIndicator(
            indicatorColor:
                widget.indicatorColor ?? teresaTheme.tapIndicatorColor,
            isHapticFeedbackEnabled: widget.isHapticFeedbackEnabled,
            onTap: widget.onTap,
            child: Center(
              child: Icon(
                widget.icon,
                size: 24,
                color: widget.iconColor ?? teresaTheme.iconEmphasis9Color,
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
  return ActionButton(
    icon: Symbols.arrow_back_ios_new_rounded,
    tooltipMessage: "Go back",
    accessibilityLabel: "",
    onTap: () {},
  );
}
