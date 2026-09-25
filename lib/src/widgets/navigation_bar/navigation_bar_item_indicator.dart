import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";

/// Displays the animated visual indicator for a navigation bar item.
///
/// [isShown] determines whether the indicator bars are expanded or collapsed.
///
/// The indicator consists of three rotated bars that animate their height
/// using [AnimationDuration.SHORT]. The bars use the current
/// [TeresaTheme.navigationBarIndicatorColor].
///
/// Example:
///
/// ```dart
/// NavigationBarItemIndicator(
///   isShown: true,
/// );
/// ```
class NavigationBarItemIndicator extends StatefulWidget {
  /// Whether the navigation bar item indicator is visible.
  final bool isShown;

  /// Creates a navigation bar item indicator with the given visibility.
  const NavigationBarItemIndicator({super.key, required this.isShown});

  @override
  State<StatefulWidget> createState() {
    return _NavigationBarItemIndicatorState();
  }
}

class _NavigationBarItemIndicatorState
    extends State<NavigationBarItemIndicator> {
  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);

    return SizedBox(
      width: 43,
      height: 27,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 21,
            child: Transform.rotate(
              angle: INDICATOR_BAR_ROTATION_ANGLE,
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 24,
                width: 8.5,
                child: Center(
                  child: AnimatedContainer(
                    duration: AnimationDuration.SHORT,
                    curve: Curves.easeInOutCirc,
                    height: widget.isShown ? 24 : 0,
                    width: 8.5,
                    decoration: BoxDecoration(
                      color: teresaTheme.navigationBarIndicatorColor,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 4.5,
            left: 28.5,
            child: Transform.rotate(
              angle: INDICATOR_BAR_ROTATION_ANGLE,
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 24,
                width: 8.5,
                child: Center(
                  child: AnimatedContainer(
                    duration: AnimationDuration.SHORT,
                    curve: Curves.easeInOutCirc,
                    height: widget.isShown ? 24 : 0,
                    width: 8.5,
                    decoration: BoxDecoration(
                      color: teresaTheme.navigationBarIndicatorColor,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 9,
            left: 36,
            child: Transform.rotate(
              angle: INDICATOR_BAR_ROTATION_ANGLE,
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 24,
                width: 8.5,
                child: Center(
                  child: AnimatedContainer(
                    duration: AnimationDuration.SHORT,
                    curve: Curves.easeInOutCirc,
                    height: widget.isShown ? 24 : 0,
                    width: 8.5,
                    decoration: BoxDecoration(
                      color: teresaTheme.navigationBarIndicatorColor,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

@Preview()
Widget preview() {
  return NavigationBarItemIndicator(isShown: true);
}
