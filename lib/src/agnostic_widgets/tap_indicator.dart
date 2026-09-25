import "package:flutter/material.dart" as material;
import "package:flutter/services.dart";
import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";

/// A reusable interactive wrapper that displays a temporary visual indicator
/// while its child is being tapped.
///
/// [indicatorColor] defines the color of the tap indicator.
/// [isHapticFeedbackEnabled] determines whether a light haptic feedback is
/// triggered when the tap is released.
/// [onTap] is called when the interaction is completed successfully.
/// [child] is the widget displayed underneath the tap indicator.
///
/// The indicator is shown when the pointer goes down and removed when the
/// pointer is released or the interaction is cancelled. Its appearance and
/// disappearance are animated using Teresa's standard short animation
/// duration.
///
/// Example:
///
/// ```dart
/// TapIndicator(
///   indicatorColor: Colors.black,
///   onTap: () {
///     // Handle tap.
///   },
///   child: const Text("Add"),
/// )
/// ```
class TapIndicator extends StatefulWidget {
  /// The color used for the temporary tap indicator.
  final Color indicatorColor;

  /// Whether light haptic feedback should be triggered after a successful tap.
  final bool isHapticFeedbackEnabled;

  /// Callback invoked when the child is tapped.
  final VoidCallback onTap;

  /// The widget displayed underneath the tap indicator.
  final Widget child;

  /// Creates a tap indicator around a widget.
  const TapIndicator({
    super.key,
    required this.indicatorColor,
    this.isHapticFeedbackEnabled = false,
    required this.onTap,
    required this.child,
  });

  @override
  State<TapIndicator> createState() {
    return _TapIndicatorState();
  }
}

class _TapIndicatorState extends State<TapIndicator> {
  late final ValueNotifier<bool> _isTapIndicatorShown;

  @override
  void initState() {
    super.initState();

    _isTapIndicatorShown = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    _isTapIndicatorShown.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext _) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: (_) {
        _isTapIndicatorShown.value = true;
      },
      onTapUp: (_) async {
        _isTapIndicatorShown.value = false;

        if (widget.isHapticFeedbackEnabled) {
          await HapticFeedback.lightImpact();
        }
      },
      onTapCancel: () {
        _isTapIndicatorShown.value = false;
      },
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Stack(
          children: [
            widget.child,
            ValueListenableBuilder<bool>(
              valueListenable: _isTapIndicatorShown,
              builder: (_, isTapIndicatorShown, _) {
                return Positioned.fill(
                  child: IgnorePointer(
                    child: AnimatedSwitcher(
                      duration: AnimationDuration.SHORT,
                      switchInCurve: Curves.easeInOutCirc,
                      switchOutCurve: Curves.easeInOutCirc,
                      transitionBuilder: (child, animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: isTapIndicatorShown
                          ? Container(
                              color: widget.indicatorColor.withValues(
                                alpha: 0.3,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

@Preview()
Widget preview() {
  return TapIndicator(
    indicatorColor: NeutralColor.VALUE_900,
    onTap: () {},
    child: Padding(
      padding: EdgeInsets.all(20),
      child: SelectableRegion(
        selectionControls: material.materialTextSelectionControls,
        child: Text("Add"),
      ),
    ),
  );
}
