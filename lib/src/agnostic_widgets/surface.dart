import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";
import "package:teresa/src/teresa_theme/colors/primary_color.dart";
import "package:teresa/src/teresa_theme/colors/secondary_color.dart";
import "package:teresa/src/teresa_theme/typography_styles/label_typography.dart";

/// A reusable surface widget that provides a consistent Teresa-styled
/// container with a background, border, rounded corners, shadow, and clipped
/// child content.
///
/// [width] and [height] optionally define the dimensions of the surface.
/// [backgroundColor] defines the surface's background color.
/// [borderColor] defines the color of the surface border.
/// [borderRadius] defines the shape and corner radius of the surface.
/// [child] is the content displayed inside the surface.
///
/// The child is clipped to the provided [borderRadius] so that its content
/// follows the same shape as the surface.
///
/// Example:
///
/// ```dart
/// Surface(
///   backgroundColor: Colors.white,
///   borderColor: Colors.grey,
///   borderRadius: BorderRadius.circular(8),
///   child: const Text("Content"),
/// )
/// ```
class Surface extends StatelessWidget {
  /// The optional width of the surface.
  final double? width;

  /// The optional height of the surface.
  final double? height;

  /// The background color of the surface.
  final Color backgroundColor;

  /// The color of the surface border.
  final Color borderColor;

  /// The border radius applied to the surface.
  final BorderRadius borderRadius;

  /// The content displayed inside the surface.
  final Widget child;

  /// Creates a Teresa-styled surface.
  const Surface({
    super.key,
    this.width,
    this.height,
    required this.backgroundColor,
    required this.borderColor,
    required this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext _) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: Border.all(
          color: borderColor,
          width: 1,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignInside,
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
      child: ClipRRect(borderRadius: borderRadius, child: child),
    );
  }
}

@Preview()
Widget preview() {
  final textStyle = LabelTypography.BOLD_12(PrimaryColor.VALUE_500);

  return Surface(
    backgroundColor: SecondaryColor.VALUE_900,
    borderColor: SecondaryColor.VALUE_800,
    borderRadius: BorderRadius.circular(textStyle.fontSize! / 2),
    child: Padding(
      padding: EdgeInsetsGeometry.symmetric(
        vertical: textStyle.fontSize! / 2,
        horizontal: textStyle.fontSize!,
      ),
      child: Text("Content", style: textStyle),
    ),
  );
}
