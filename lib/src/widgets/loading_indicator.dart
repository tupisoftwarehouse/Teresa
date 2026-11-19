import "package:flutter/material.dart" as material;
import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/widgets/widget_previewing_wrapper.dart";

/// Displays a circular loading indicator using the current Teresa theme.
///
/// [accessibilityLabel] provides the semantic label exposed to accessibility
/// services.
///
/// The indicator is centered within its available space and uses the
/// [TeresaTheme.loadingIndicatorColor] for its color.
class LoadingIndicator extends StatelessWidget {
  /// The accessibility label exposed for the loading indicator.
  final String accessibilityLabel;

  /// Creates a loading indicator with the given [accessibilityLabel].
  const LoadingIndicator({super.key, required this.accessibilityLabel});

  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);

    return Semantics(
      label: accessibilityLabel,
      container: true,
      child: Center(
        child: material.CircularProgressIndicator(
          color: teresaTheme.loadingIndicatorColor,
          strokeCap: StrokeCap.round,
          strokeAlign: BorderSide.strokeAlignCenter,
          strokeWidth: 6,
        ),
      ),
    );
  }
}

@Preview()
Widget preview() {
  return const WidgetPreviewingWrapper(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: LoadingIndicator(accessibilityLabel: ""),
    ),
  );
}
