import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/agnostic_widgets/surface.dart";
import "package:teresa/src/agnostic_widgets/tap_indicator.dart";
import "package:teresa/src/agnostic_widgets/tooltip.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/teresa_theme/animation/animation_curves/animation_curves.dart";
import "package:teresa/src/teresa_theme/animation/animation_duration/animation_duration.dart";
import "package:teresa/src/widgets/widget_previewing_wrapper.dart";

/// Displays a circular action button with customizable colors and feedback.
///
/// [icon] identifies the action represented by the button.
/// [backgroundColor] optionally overrides the button's background color.
/// [borderColor] optionally overrides the button's border color.
/// [iconColor] optionally overrides the icon color.
/// [isShown] determines whether the button is currently shown.
/// [indicatorColor] optionally overrides the tap indicator color.
/// [isSpaceKept] determines whether the button's layout space is kept when
/// hidden.
/// [tooltipMessage] is displayed when the user requests the button's tooltip.
/// [accessibilityLabel] provides the semantic label exposed to accessibility
/// services.
/// [isHapticFeedbackEnabled] determines whether haptic feedback is triggered
/// when the button is tapped.
/// [onTapped] is called when the button is tapped.
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
///   onTapped: () {
///     // Navigate back.
///   },
/// );
/// ```
class ActionButton extends StatelessWidget {
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

  /// Whether the action button is currently shown.
  ///
  /// Defaults to `true`.
  final bool isShown;

  /// An optional color for the button's tap indicator.
  ///
  /// When `null`, the tap indicator color from [TeresaTheme] is used.
  final Color? indicatorColor;

  /// Whether the button's layout space is kept when hidden.
  ///
  /// Defaults to `false`.
  final bool isSpaceKept;

  /// The tooltip message displayed for the action button.
  final String tooltipMessage;

  /// The accessibility label exposed for the action button.
  final String accessibilityLabel;

  /// Whether haptic feedback is triggered when the button is tapped.
  ///
  /// Defaults to `true`.
  final bool isHapticFeedbackEnabled;

  /// Called when the action button is tapped.
  final VoidCallback onTapped;

  /// Creates a circular action button with optional color overrides.
  const ActionButton({
    super.key,
    required this.icon,
    this.isShown = true,
    this.backgroundColor,
    this.borderColor,
    this.iconColor,
    this.indicatorColor,
    this.isSpaceKept = false,
    required this.tooltipMessage,
    required this.accessibilityLabel,
    this.isHapticFeedbackEnabled = true,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);

    return Semantics(
      label: accessibilityLabel,
      button: true,
      child: AnimatedContainer(
        height: isShown || isSpaceKept ? 64 : 0,
        width: isShown || isSpaceKept ? 64 : 0,
        duration: AnimationDuration.SHORT,
        curve: AnimationCurves.instance,
        child: Center(
          child: AnimatedScale(
            scale: isShown ? 1 : 0,
            curve: AnimationCurves.instance,
            duration: AnimationDuration.SHORT,
            child: Tooltip(
              message: tooltipMessage,
              verticalDisplacement: 40,
              child: Surface(
                backgroundColor:
                    backgroundColor ??
                    teresaTheme.elevatedSurface.backgroundColor,
                borderColor:
                    borderColor ?? teresaTheme.elevatedSurface.borderColor,
                borderRadius: BorderRadius.circular(1000),
                height: 64,
                width: 64,
                child: TapIndicator(
                  indicatorColor:
                      indicatorColor ?? teresaTheme.tapIndicatorColor,
                  isHapticFeedbackEnabled: isHapticFeedbackEnabled,
                  onTapped: onTapped,
                  child: Center(
                    child: Icon(
                      icon,
                      size: 24,
                      color: iconColor ?? teresaTheme.iconEmphasis9Color,
                      fill: 1,
                      weight: FontWeight.w900.value.toDouble(),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
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
  return WidgetPreviewingWrapper(
    child: ActionButton(
      icon: Symbols.arrow_back_ios_new_rounded,
      tooltipMessage: "Go back",
      accessibilityLabel: "",
      onTapped: () {},
    ),
  );
}
