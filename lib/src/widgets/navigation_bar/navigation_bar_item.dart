import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/agnostic_widgets/tap_indicator.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";
import "package:teresa/src/teresa_theme/icon_styles/label_icon.dart";
import "package:teresa/src/teresa_theme/typography_styles/label_typography.dart";
import "package:teresa/src/widgets/navigation_bar/navigation_bar_item_indicator.dart";
import "package:teresa/teresa.dart";

class NavigationBarItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final String accessibilityLabel;
  final VoidCallback onTap;

  const NavigationBarItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.accessibilityLabel,
    required this.onTap,
  });

  @override
  State<StatefulWidget> createState() {
    return _NavigationBarItemState();
  }
}

class _NavigationBarItemState extends State<NavigationBarItem> {
  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);

    return Semantics(
      label: widget.accessibilityLabel,
      button: true,
      child: IntrinsicWidth(
        child: TapIndicator(
          indicatorColor: teresaTheme.tapIndicatorColor,
          onTap: widget.onTap,
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
                    child: NavigationBarItemIndicator(
                      isShown: widget.isSelected,
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: widget.isSelected ? 1 : 0.3,
                  duration: AnimationDuration.SHORT,
                  curve: Curves.easeInOutCirc,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LabelIcon.SEMIBOLD_16(
                        widget.icon,
                        teresaTheme.iconEmphasis9Color,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.title,
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
  return Padding(
    padding: EdgeInsetsGeometry.all(16),
    child: NavigationBarItem(
      icon: Symbols.equal_rounded,
      title: "Calculator",
      isSelected: true,
      accessibilityLabel: "",
      onTap: () {},
    ),
  );
}
