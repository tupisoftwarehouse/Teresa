import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart" hide Orientation;
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/agnostic_widgets/surface.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/widgets/divider.dart";
import "package:teresa/src/widgets/navigation_bar/navigation_bar_item.dart";
import "package:teresa/src/orientation/orientation.dart";

/// Displays a horizontal navigation bar containing selectable navigation items.
///
/// [items] defines the navigation options displayed in the bar. A divider is
/// automatically inserted between each adjacent item.
///
/// The navigation bar uses the current [TeresaTheme] for its elevated surface
/// background and border colors.
///
/// Example:
///
/// ```dart
/// NavigationBar(
///   items: [
///     NavigationBarItem(
///       icon: Symbols.equal_rounded,
///       title: "Calculator",
///       isSelected: true,
///       accessibilityLabel: "Calculator",
///       onTap: () {},
///     ),
///     NavigationBarItem(
///       icon: Symbols.widgets_rounded,
///       title: "Utilities",
///       isSelected: false,
///       accessibilityLabel: "Utilities",
///       onTap: () {},
///     ),
///   ],
/// );
/// ```
class NavigationBar extends StatefulWidget {
  /// The navigation items displayed in the bar.
  final List<NavigationBarItem> items;

  /// Creates a navigation bar containing the given [items].
  const NavigationBar({super.key, required this.items});

  @override
  State<StatefulWidget> createState() {
    return _NavigationBarState();
  }
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);
    final itemsWithDividers = widget.items.expand((item) {
      return [
        item,
        Divider(
          color: teresaTheme.elevatedSurface.borderColor,
          orientation: Orientation.VERTICAL,
        ),
      ];
    }).toList()..removeLast();

    return IntrinsicWidth(
      child: Surface(
        height: 64,
        backgroundColor: teresaTheme.elevatedSurface.backgroundColor,
        borderColor: teresaTheme.elevatedSurface.borderColor,
        borderRadius: BorderRadius.circular(1000),
        child: Row(mainAxisSize: MainAxisSize.min, children: itemsWithDividers),
      ),
    );
  }
}

@Preview()
Widget preview() {
  return NavigationBar(
    items: [
      NavigationBarItem(
        icon: Symbols.equal_rounded,
        title: "Calculator",
        isSelected: true,
        accessibilityLabel: "",
        onTap: () {},
      ),
      NavigationBarItem(
        icon: Symbols.widgets_rounded,
        title: "Utilities",
        isSelected: false,
        accessibilityLabel: "",
        onTap: () {},
      ),
    ],
  );
}
