import "package:flutter/material.dart" as material;
import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart" hide Orientation;
import "package:teresa/src/internals/checker/teresa_checker.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";
import "package:teresa/src/orientation/orientation.dart";

/// Displays a themed divider in either horizontal or vertical orientation.
///
/// [color] defines the color of the divider.
/// [orientation] determines whether the divider is rendered horizontally or
/// vertically.
///
/// The divider uses Flutter's [material.Divider] for horizontal orientation
/// and [material.VerticalDivider] for vertical orientation. Both variants use
/// the same thickness, width, and rounded corners.
class Divider extends StatelessWidget {
  /// The color used to paint the divider.
  final Color color;

  /// The orientation in which the divider is displayed.
  final Orientation orientation;

  /// Creates a divider with the given [color] and [orientation].
  const Divider({super.key, required this.color, required this.orientation});

  @override
  Widget build(BuildContext _) {
    return isOrientationHorizontal(orientation)
        ? material.Divider(
            color: color,
            height: 1,
            endIndent: 0,
            radius: BorderRadius.circular(1000),
            thickness: 1,
            indent: 0,
          )
        : material.VerticalDivider(
            color: color,
            width: 1,
            endIndent: 0,
            radius: BorderRadius.circular(1000),
            thickness: 1,
            indent: 0,
          );
  }
}

@Preview()
Widget preview() {
  return Divider(
    color: NeutralColor.VALUE_300,
    orientation: Orientation.HORIZONTAL,
  );
}
