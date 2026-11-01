import "package:flutter/material.dart" as material;
import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:teresa/src/teresa_entities/reference_entity.dart";
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
/// The indicator expands from the tap position and fades out.
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
  late final GlobalKey _rippleSurfaceKey;
  late ReferenceEntity<material.InkRipple> _activeRipple;

  @override
  void initState() {
    super.initState();

    _rippleSurfaceKey = GlobalKey();

    _activeRipple = ReferenceEntity<material.InkRipple>();
  }

  @override
  void deactivate() {
    if (_activeRipple.isInitialized) {
      _activeRipple.value.dispose();

      _activeRipple.deinitialize();
    }

    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTapDown: (details) {
            final rippleELementRenderBox =
                _rippleSurfaceKey.currentContext!.findRenderObject()
                    as RenderBox;
            late final material.InkRipple rippleElement;

            if (_activeRipple.isInitialized) {
              _activeRipple.value.cancel();
            }

            rippleElement = material.InkRipple(
              controller: material.Material.of(
                _rippleSurfaceKey.currentContext!,
              ),
              referenceBox: rippleELementRenderBox,
              position: details.localPosition,
              color: widget.indicatorColor.withValues(alpha: 0.3),
              textDirection: Directionality.of(context),
              containedInkWell: true,
              rectCallback: () {
                return Offset.zero & rippleELementRenderBox.size;
              },
              onRemoved: () {
                if (_activeRipple.isInitialized) {
                  _activeRipple = ReferenceEntity<material.InkRipple>();
                }
              },
            );
            _activeRipple.value = rippleElement;
          },
          onTapUp: (_) {
            if (_activeRipple.isInitialized) {
              _activeRipple.value.confirm();
            }

            if (widget.isHapticFeedbackEnabled) {
              material.Feedback.forTap(context);
            }

            widget.onTapped();
          },
          onTapCancel: () {
            if (_activeRipple.isInitialized) {
              _activeRipple.value.cancel();
            }
          },
          child: widget.child,
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: material.Material(
              color: NeutralColor.TRANSPARENT,
              child: SizedBox.expand(key: _rippleSurfaceKey),
            ),
          ),
        ),
      ],
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
