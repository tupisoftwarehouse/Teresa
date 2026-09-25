import "package:flutter/material.dart" as material;
import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";

/// Displays a circular loading indicator using the current Teresa theme.
///
/// [accessibilityLabel] provides the semantic label exposed to accessibility
/// services.
///
/// The indicator is centered within its available space and uses the
/// [TeresaTheme.loadingIndicatorColor] for its color.
class LoadingIndicator extends StatefulWidget {
  /// The accessibility label exposed for the loading indicator.
  final String accessibilityLabel;

  /// Creates a loading indicator with the given [accessibilityLabel].
  const LoadingIndicator({super.key, required this.accessibilityLabel});

  @override
  State<LoadingIndicator> createState() {
    return _LoadingIndicatorState();
  }
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);

    return Semantics(
      label: widget.accessibilityLabel,
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
  return Padding(
    padding: const EdgeInsets.all(16),
    child: LoadingIndicator(accessibilityLabel: ""),
  );
}
