import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";

/// Displays a translucent foreground backdrop that can be shown or hidden
/// with a fade animation.
///
/// [isVisible] determines whether the backdrop is displayed.
/// [accessibilityLabel] provides the semantic label exposed to accessibility
/// services.
/// [onTap] is called when the visible backdrop is tapped.
///
/// The backdrop covers the available space with a translucent neutral color
/// and uses [AnimationDuration.LONG] for its fade transition.
///
/// Example:
///
/// ```dart
/// Stack(
///   children: [
///     const MyPageContent(),
///     ForegroundBackdrop(
///       isVisible: true,
///       accessibilityLabel: "Close overlay",
///       onTap: () {
///         // Hide the overlay.
///       },
///     ),
///   ],
/// );
/// ```
class ForegroundBackdrop extends StatelessWidget {
  /// Whether the foreground backdrop is currently visible.
  final bool isVisible;

  /// The accessibility label exposed for the backdrop.
  final String accessibilityLabel;

  /// Called when the visible backdrop is tapped.
  final VoidCallback onTap;

  /// Creates a foreground backdrop with the given visibility, accessibility
  /// label, and tap callback.
  const ForegroundBackdrop({
    super.key,
    required this.isVisible,
    required this.accessibilityLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: accessibilityLabel,
      button: true,
      child: AnimatedSwitcher(
        duration: AnimationDuration.LONG,
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: isVisible
            ? GestureDetector(
                onTap: onTap,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: NeutralColor.VALUE_900.withValues(alpha: 0.8),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}

@Preview()
Widget preview() {
  return SizedBox(
    height: WIDGET_PREVIEW_MAXIMUM_SIZE,
    width: WIDGET_PREVIEW_MAXIMUM_SIZE,
    child: Stack(
      children: [
        ForegroundBackdrop(
          isVisible: true,
          accessibilityLabel: "",
          onTap: () {},
        ),
      ],
    ),
  );
}
