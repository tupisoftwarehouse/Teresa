import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";

/// Constrains page content to a maximum width and centers it within the
/// available space.
///
/// [child] is the content displayed inside the wrapper.
///
/// The wrapper limits the content to a maximum width of 1280 pixels while
/// allowing it to use less space when the available width is smaller.
class PageContentWrapper extends StatelessWidget {
  /// The page content displayed inside the wrapper.
  final Widget child;

  /// Creates a page content wrapper for the given [child].
  const PageContentWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1280),
        child: child,
      ),
    );
  }
}

@Preview()
Widget preview() {
  return PageContentWrapper(child: Text("Content"));
}
