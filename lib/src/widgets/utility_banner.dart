import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/agnostic_widgets/tap_indicator.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";
import "package:teresa/src/teresa_theme/colors/primary_color.dart";
import "package:teresa/src/teresa_theme/colors/secondary_color.dart";
import "package:teresa/src/teresa_theme/typography_styles/header_typography.dart";

/// Displays a prominent interactive banner for utility actions.
///
/// [icon] identifies the utility represented by the banner.
/// [title] is the text displayed below the icon.
/// [accessibilityLabel] provides the semantic label exposed to accessibility
/// services.
/// [onTap] is called when the banner is tapped.
///
/// The banner uses Teresa's secondary and primary color palettes and provides
/// visual feedback through [TapIndicator].
///
/// Example:
///
/// ```dart
/// UtilityBanner(
///   icon: Symbols.activity_zone_rounded,
///   title: "Area Converter",
///   accessibilityLabel: "Open area converter",
///   onTap: () {},
/// );
/// ```
class UtilityBanner extends StatelessWidget {
  /// The icon representing the utility.
  final IconData icon;

  /// The title displayed by the banner.
  final String title;

  /// The semantic label exposed to accessibility services.
  final String accessibilityLabel;

  /// The callback invoked when the banner is tapped.
  final VoidCallback onTap;

  /// Creates an interactive utility banner.
  const UtilityBanner({
    super.key,
    required this.icon,
    required this.title,
    required this.accessibilityLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext _) {
    return Semantics(
      label: accessibilityLabel,
      button: true,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(26)),
        child: TapIndicator(
          indicatorColor: NeutralColor.VALUE_50,
          onTap: onTap,
          child: Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: SecondaryColor.VALUE_900,
              borderRadius: const BorderRadius.all(Radius.circular(26)),
              border: Border.all(
                color: SecondaryColor.VALUE_800,
                width: 1,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -180,
                  top: -90,
                  child: Icon(
                    icon,
                    size: 360,
                    color: SecondaryColor.VALUE_800,
                    weight: FontWeight.w900.value.toDouble(),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Positioned(
                  top: 32,
                  left: 26,
                  right: 26,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        icon,
                        fill: 1,
                        size: 76,
                        color: PrimaryColor.VALUE_500,
                        weight: FontWeight.w900.value.toDouble(),
                        fontWeight: FontWeight.w900,
                      ),
                      const SizedBox(height: 13),
                      Text(
                        title,
                        style: HeaderTypography.HEADING_4(
                          NeutralColor.VALUE_50,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ],
                  ),
                ),
              ],
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
    child: UtilityBanner(
      icon: Symbols.activity_zone_rounded,
      title: "Area Converter",
      accessibilityLabel: "",
      onTap: () {},
    ),
  );
}
