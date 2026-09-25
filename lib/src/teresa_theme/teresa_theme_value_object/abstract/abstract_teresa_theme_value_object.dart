import "package:flutter/services.dart";
import "package:flutter/widgets.dart" as widget;

import "package:teresa/src/internals/value_objects/widget_style_value_objects/input_style_value_object.dart";
import "package:teresa/src/internals/value_objects/widget_style_value_objects/surface_style_value_object.dart";

/// Defines the complete set of visual values used by a Teresa theme.
///
/// Implementations provide the colors and style value objects consumed by
/// Teresa's widgets and user interface components. This abstraction allows
/// different theme configurations, such as light and dark themes, to expose
/// the same set of visual properties.
///
/// Use a concrete implementation such as
/// [ConcreteLightTeresaThemeValueObject] or
/// [ConcreteDarkTeresaThemeValueObject] to provide the actual theme values.
abstract class AbstractTeresaThemeValueObject {
  /// The color used for the first text emphasis level.
  abstract final widget.Color textEmphasis1Color;

  /// The color used for the second text emphasis level.
  abstract final widget.Color textEmphasis2Color;

  /// The color used for the third text emphasis level.
  abstract final widget.Color textEmphasis3Color;

  /// The color used for the fourth text emphasis level.
  abstract final widget.Color textEmphasis4Color;

  /// The color used for the fifth text emphasis level.
  abstract final widget.Color textEmphasis5Color;

  /// The color used for the sixth text emphasis level.
  abstract final widget.Color textEmphasis6Color;

  /// The color used for the seventh text emphasis level.
  abstract final widget.Color textEmphasis7Color;

  /// The color used for the eighth text emphasis level.
  abstract final widget.Color textEmphasis8Color;

  /// The color used for the ninth text emphasis level.
  abstract final widget.Color textEmphasis9Color;

  /// The color used for the first icon emphasis level.
  abstract final widget.Color iconEmphasis1Color;

  /// The color used for the second icon emphasis level.
  abstract final widget.Color iconEmphasis2Color;

  /// The color used for the third icon emphasis level.
  abstract final widget.Color iconEmphasis3Color;

  /// The color used for the fourth icon emphasis level.
  abstract final widget.Color iconEmphasis4Color;

  /// The color used for the fifth icon emphasis level.
  abstract final widget.Color iconEmphasis5Color;

  /// The color used for the sixth icon emphasis level.
  abstract final widget.Color iconEmphasis6Color;

  /// The color used for the seventh icon emphasis level.
  abstract final widget.Color iconEmphasis7Color;

  /// The color used for the eighth icon emphasis level.
  abstract final widget.Color iconEmphasis8Color;

  /// The color used for the ninth icon emphasis level.
  abstract final widget.Color iconEmphasis9Color;

  /// Defines the visual style of input fields.
  abstract final InputStyleValueObject input;

  /// Defines the visual style of text areas.
  abstract final InputStyleValueObject textArea;

  /// The color used for selected indicators.
  abstract final widget.Color selectedIndicatorColor;

  /// The color used for icons in an unselected state.
  abstract final widget.Color unselectedIconColor;

  /// Defines the visual style of standard surfaces.
  abstract final SurfaceStyleValueObject surface;

  /// Defines the visual style of elevated surfaces.
  abstract final SurfaceStyleValueObject elevatedSurface;

  /// The color used by tap indicators.
  abstract final widget.Color tapIndicatorColor;

  /// The color used by loading indicators.
  abstract final widget.Color loadingIndicatorColor;

  /// The color used by navigation bar indicators.
  abstract final widget.Color navigationBarIndicatorColor;

  /// Defines the system UI overlay style associated with the theme.
  abstract final SystemUiOverlayStyle systemUiOverlayStyle;
}
