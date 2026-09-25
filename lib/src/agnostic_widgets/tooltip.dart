import "dart:async";

import "package:flutter/services.dart";
import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:flutter/material.dart" as material;
import "package:teresa/src/agnostic_widgets/surface.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/internals/checker/teresa_checker.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";
import "package:teresa/src/teresa_theme/typography_styles/label_typography.dart";

/// A Teresa-styled tooltip that displays contextual information when the
/// user performs a long-press gesture on its child.
///
/// The tooltip is manually triggered and automatically dismissed after the
/// configured tooltip display duration. It uses the active [TeresaTheme] to
/// determine its colors, typography, borders, spacing, and elevation.
///
/// [message] is the text displayed inside the tooltip.
/// [verticalDisplacement] controls the vertical distance between the tooltip
/// and its child.
/// [child] is the widget that the tooltip is attached to.
///
/// Example:
///
/// ```dart
/// Tooltip(
///   message: "Go back",
///   verticalDisplacement: 24,
///   child: Icon(Icons.arrow_back),
/// )
/// ```
///
/// The tooltip is designed for contextual UI feedback and is triggered by
/// long-press rather than by Flutter's default tooltip interaction.
class Tooltip extends StatefulWidget {
  /// The text displayed by the tooltip.
  final String message;

  /// The vertical distance between the tooltip and its child.
  final double verticalDisplacement;

  /// The widget to which the tooltip is attached.
  final Widget child;

  /// Creates a Teresa-styled tooltip.
  const Tooltip({
    super.key,
    required this.message,
    required this.verticalDisplacement,
    required this.child,
  });

  @override
  State<StatefulWidget> createState() {
    return _TooltipState();
  }
}

class _TooltipState extends State<Tooltip> {
  late final GlobalKey<material.TooltipState> _tooltipKey;
  Timer? _tooltipShowingTimer;

  @override
  void initState() {
    super.initState();

    _tooltipKey = GlobalKey();
  }

  @override
  void dispose() {
    super.dispose();

    if (!isObjectNotInitialized(_tooltipShowingTimer)) {
      _tooltipShowingTimer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);

    return GestureDetector(
      onLongPress: () async {
        _tooltipKey.currentState?.ensureTooltipVisible();

        await HapticFeedback.lightImpact();

        _tooltipShowingTimer = Timer(TOOLTIP_SHOWING_DURATION, () {
          material.Tooltip.dismissAllToolTips();
        });
      },
      child: material.Tooltip(
        key: _tooltipKey,
        message: widget.message,
        margin: EdgeInsets.zero,
        verticalOffset: widget.verticalDisplacement,
        constraints: const BoxConstraints.tightFor(height: 30),
        padding: EdgeInsets.symmetric(
          horizontal: LabelTypography.BOLD_12(teresaTheme.textEmphasis9Color)
              .fontSize!,
          vertical:
              LabelTypography.BOLD_12(teresaTheme.textEmphasis9Color)
                  .fontSize! /
              2,
        ),
        decoration: BoxDecoration(
          color: teresaTheme.elevatedSurface.backgroundColor,
          border: BoxBorder.all(
            color: teresaTheme.elevatedSurface.borderColor,
            width: 1,
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
          borderRadius: BorderRadius.circular(
            LabelTypography.BOLD_12(teresaTheme.textEmphasis9Color).fontSize! /
                2,
          ),
          boxShadow: [
            BoxShadow(
              color: NeutralColor.VALUE_1000.withValues(alpha: 0.15),
              offset: const Offset(0, 6),
              blurRadius: 10,
              spreadRadius: 4,
            ),
            BoxShadow(
              color: NeutralColor.VALUE_1000.withValues(alpha: 0.3),
              offset: const Offset(0, 2),
              blurRadius: 3,
            ),
          ],
        ),
        enableFeedback: false,
        enableTapToDismiss: false,
        ignorePointer: true,
        excludeFromSemantics: true,
        preferBelow: true,
        triggerMode: material.TooltipTriggerMode.manual,
        mouseCursor: material.MouseCursor.defer,
        textStyle: LabelTypography.BOLD_12(teresaTheme.textEmphasis9Color),
        textAlign: TextAlign.center,
        waitDuration: Duration.zero,
        exitDuration: AnimationDuration.SHORT,
        showDuration: AnimationDuration.SHORT,
        child: widget.child,
      ),
    );
  }
}

@Preview()
Widget preview() {
  final textStyle = LabelTypography.BOLD_12(NeutralColor.VALUE_900);

  return Tooltip(
    message: "Go back",
    verticalDisplacement: 24,
    child: Surface(
      backgroundColor: NeutralColor.VALUE_50,
      borderColor: NeutralColor.VALUE_300,
      borderRadius: BorderRadius.circular(textStyle.fontSize! / 2),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          vertical: textStyle.fontSize! / 2,
          horizontal: textStyle.fontSize!,
        ),
        child: Text("Content", style: textStyle),
      ),
    ),
  );
}
