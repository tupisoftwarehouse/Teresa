import "dart:math";

import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:teresa/src/agnostic_widgets/surface.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";
import "package:teresa/src/teresa_theme/typography_styles/header_typography.dart";
import "package:teresa/src/widgets/widget_previewing_wrapper.dart";

class DebugModeBanner extends StatelessWidget {
  const DebugModeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);

    return Positioned(
      top: 16,
      right: -31,
      child: Transform.rotate(
        angle: pi / 4,
        child: Surface(
          height: 33,
          width: 124,
          backgroundColor: teresaTheme.debugModeBannerSurface.backgroundColor,
          borderColor: teresaTheme.debugModeBannerSurface.borderColor,
          borderRadius: BorderRadius.zero,
          child: Center(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 7),
              child: Text(
                "Debug",
                style: HeaderTypography.HEADING_6(NeutralColor.VALUE_50),
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
  return WidgetPreviewingWrapper(child: Stack(children: [DebugModeBanner()]));
}
