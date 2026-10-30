import "package:flutter/material.dart" as material;
import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";
import "package:teresa/src/widgets/widget_previewing_wrapper.dart";

/// A reusable interactive wrapper that displays a temporary visual indicator
/// while its child is being tapped.
///
/// [indicatorColor] defines the color of the tap indicator.
/// [isHapticFeedbackEnabled] determines whether a light haptic feedback is
/// triggered when the tap is released.
/// [onTapped] is called when the interaction is completed successfully.
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
///   isHapticFeedbackEnabled: true,
///   onTapped: () {
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
  final VoidCallback onTapped;

  /// The widget displayed underneath the tap indicator.
  final Widget child;

  /// Creates a tap indicator around a widget.
  const TapIndicator({
    super.key,
    required this.indicatorColor,
    this.isHapticFeedbackEnabled = false,
    required this.onTapped,
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
    return material.Material(
      color: NeutralColor.TRANSPARENT,
      child: material.InkWell(
        splashColor: widget.indicatorColor.withValues(alpha: 0.3),
        focusColor: NeutralColor.TRANSPARENT,
        hoverColor: NeutralColor.TRANSPARENT,
        highlightColor: NeutralColor.TRANSPARENT,
        enableFeedback: widget.isHapticFeedbackEnabled,
        onTap: widget.onTapped,
        child: widget.child,
      ),
    );
  }
}

@Preview()
Widget preview() {
  return WidgetPreviewingWrapper(
    child: TapIndicator(
      indicatorColor: NeutralColor.VALUE_900,
      onTapped: () {},
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SelectableRegion(
          selectionControls: material.materialTextSelectionControls,
          child: const Text("Add"),
        ),
      ),
    ),
  );
}
