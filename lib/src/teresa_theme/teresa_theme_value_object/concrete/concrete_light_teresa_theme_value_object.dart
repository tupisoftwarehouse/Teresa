import "package:flutter/services.dart";
import "package:flutter/widgets.dart" as widget;
import "package:teresa/src/internals/value_objects/widget_style_value_objects/input_style_value_object.dart";
import "package:teresa/src/internals/value_objects/widget_style_value_objects/surface_style_value_object.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";
import "package:teresa/src/teresa_theme/colors/primary_color.dart";
import "package:teresa/src/teresa_theme/colors/secondary_color.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/abstract/abstract_teresa_theme_value_object.dart";

class ConcreteLightTeresaThemeValueObject
    implements AbstractTeresaThemeValueObject {
  @override
  final widget.Color textEmphasis1Color = NeutralColor.VALUE_100;

  @override
  final widget.Color textEmphasis2Color = NeutralColor.VALUE_200;

  @override
  final widget.Color textEmphasis3Color = NeutralColor.VALUE_300;

  @override
  final widget.Color textEmphasis4Color = NeutralColor.VALUE_400;

  @override
  final widget.Color textEmphasis5Color = NeutralColor.VALUE_500;

  @override
  final widget.Color textEmphasis6Color = NeutralColor.VALUE_600;

  @override
  final widget.Color textEmphasis7Color = NeutralColor.VALUE_700;

  @override
  final widget.Color textEmphasis8Color = NeutralColor.VALUE_800;

  @override
  final widget.Color textEmphasis9Color = NeutralColor.VALUE_900;

  @override
  final widget.Color iconEmphasis1Color = NeutralColor.VALUE_100;

  @override
  final widget.Color iconEmphasis2Color = NeutralColor.VALUE_200;

  @override
  final widget.Color iconEmphasis3Color = NeutralColor.VALUE_300;

  @override
  final widget.Color iconEmphasis4Color = NeutralColor.VALUE_400;

  @override
  final widget.Color iconEmphasis5Color = NeutralColor.VALUE_500;

  @override
  final widget.Color iconEmphasis6Color = NeutralColor.VALUE_600;

  @override
  final widget.Color iconEmphasis7Color = NeutralColor.VALUE_700;

  @override
  final widget.Color iconEmphasis8Color = NeutralColor.VALUE_800;

  @override
  final widget.Color iconEmphasis9Color = NeutralColor.VALUE_900;

  @override
  final InputStyleValueObject input = InputStyleValueObject(
    NeutralColor.VALUE_900,
    NeutralColor.VALUE_400,
    NeutralColor.VALUE_100,
  );

  @override
  final InputStyleValueObject textArea = InputStyleValueObject(
    NeutralColor.VALUE_900,
    NeutralColor.VALUE_400,
    NeutralColor.TRANSPARENT,
  );

  @override
  final widget.Color selectedIndicatorColor = PrimaryColor.VALUE_300;

  @override
  final widget.Color unselectedIconColor = NeutralColor.VALUE_300;

  @override
  final SurfaceStyleValueObject surface = SurfaceStyleValueObject(
    NeutralColor.VALUE_50,
    NeutralColor.TRANSPARENT,
  );

  @override
  final SurfaceStyleValueObject elevatedSurface = SurfaceStyleValueObject(
    NeutralColor.VALUE_50,
    NeutralColor.VALUE_300,
  );

  @override
  final widget.Color tapIndicatorColor = NeutralColor.VALUE_900;

  @override
  final widget.Color loadingIndicatorColor = SecondaryColor.VALUE_900;

  @override
  final widget.Color navigationBarIndicatorColor = PrimaryColor.VALUE_300;

  @override
  final SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: NeutralColor.TRANSPARENT,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );
}
