import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/agnostic_widgets/tap_indicator.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";
import "package:teresa/src/teresa_theme/icon_styles/label_icon.dart";
import "package:teresa/src/teresa_theme/typography_styles/label_typography.dart";
import "package:teresa/src/widgets/navigation_bar/navigation_bar_item_indicator.dart";
import "package:teresa/src/widgets/widget_previewing_wrapper.dart";

/// Displays a selectable icon and title for a [NavigationBar].
///
/// [icon] and [title] identify the destination. [isSelected] controls the
/// selection indicator and the item's opacity, while [accessibilityLabel]
/// provides the semantic label exposed to accessibility services.
/// [onTapped] is called when the item is tapped.
///
/// The item uses the current [TeresaTheme] for its colors and provides tap
/// feedback through [TapIndicator].
///
/// Example:
///
/// ```dart
/// NavigationBarItem(
///   icon: Symbols.equal_rounded,
///   title: "Calculator",
///   isSelected: true,
///   accessibilityLabel: "Calculator",
///   onTapped: () {},
/// );
/// ```
class NavigationBarItem extends StatelessWidget {
  /// The icon representing the navigation destination.
  final IconData icon;

  /// The title displayed below the [icon].
  final String title;

  /// Whether this item is currently selected.
  final bool isSelected;

  /// The semantic label exposed to accessibility services.
  final String accessibilityLabel;

  /// The callback invoked when the item is tapped.
  final VoidCallback onTapped;

  /// Creates a navigation bar item with the given icon, title, selection
  /// state, accessibility label, and tap callback.
  const NavigationBarItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.accessibilityLabel,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);

    return Semantics(
      label: accessibilityLabel,
      button: true,
      child: IntrinsicWidth(
        child: TapIndicator(
          indicatorColor: teresaTheme.tapIndicatorColor,
          onTapped: onTapped,
          child: Padding(
            padding: const EdgeInsetsGeometry.only(
              top: 14,
              right: 26,
              bottom: 8,
              left: 26,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.passthrough,
              children: [
                Positioned(
                  left: 3,
                  right: 0,
                  top: -6,
                  child: Center(
                    child: NavigationBarItemIndicator(isShown: isSelected),
                  ),
                ),
                AnimatedOpacity(
                  opacity: isSelected ? 1 : 0.3,
                  duration: AnimationDuration.SHORT,
                  curve: Curves.easeInOutCirc,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LabelIcon.SEMIBOLD_16(
                        icon,
                        teresaTheme.iconEmphasis9Color,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        title,
                        style: LabelTypography.SEMIBOLD_12(
                          teresaTheme.textEmphasis9Color,
                        ),
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
  return WidgetPreviewingWrapper(
    child: NavigationBarItem(
      icon: Symbols.equal_rounded,
      title: "Calculator",
      isSelected: true,
      accessibilityLabel: "",
      onTapped: () {},
    ),
  );
}
