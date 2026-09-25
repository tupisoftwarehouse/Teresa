import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/agnostic_widgets/tap_indicator.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";
import "package:teresa/src/teresa_theme/colors/primary_color.dart";
import "package:teresa/src/teresa_theme/icon_styles/header_icon.dart";
import "package:teresa/src/teresa_theme/typography_styles/header_typography.dart";

/// Displays a full-width button containing an icon and a text title.
///
/// [icon] identifies the action represented by the button.
/// [title] is the text displayed alongside the icon.
/// [accessibilityLabel] provides the semantic label exposed to accessibility
/// services.
/// [onTap] is called when the button is tapped.
///
/// The button uses Teresa's primary color palette and provides visual and
/// haptic feedback through [TapIndicator].
///
/// Example:
///
/// ```dart
/// IconButton(
///   icon: Symbols.add_rounded,
///   title: "Add",
///   accessibilityLabel: "Add",
///   onTap: () {
///     // Perform the action.
///   },
/// );
/// ```
class IconButton extends StatelessWidget {
  /// The icon displayed by the button.
  final IconData icon;

  /// The text displayed alongside the icon.
  final String title;

  /// The accessibility label exposed for the button.
  final String accessibilityLabel;

  /// Called when the button is tapped.
  final VoidCallback onTap;

  /// Creates an icon button with the given icon, title, accessibility label,
  /// and tap callback.
  const IconButton({
    super.key,
    required this.icon,
    required this.title,
    required this.accessibilityLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext _) {
    return Semantics(
      button: true,
      label: accessibilityLabel,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 64,
          width: double.infinity,
          decoration: BoxDecoration(
            color: PrimaryColor.VALUE_500,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TapIndicator(
            indicatorColor: NeutralColor.VALUE_900,
            isHapticFeedbackEnabled: true,
            onTap: onTap,
            child: Container(
              padding: EdgeInsetsGeometry.only(top: 17, left: 16, right: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 6.5,
                children: [
                  HeaderIcon.HEADING_4(icon, NeutralColor.VALUE_900),
                  Flexible(
                    child: SelectionContainer.disabled(
                      child: Text(
                        title,
                        style: HeaderTypography.HEADING_4(
                          NeutralColor.VALUE_900,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
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
  return SizedBox(
    width: WIDGET_PREVIEW_MAXIMUM_SIZE,
    child: IconButton(
      icon: Symbols.add_rounded,
      title: "Add",
      accessibilityLabel: "",
      onTap: () {},
    ),
  );
}
