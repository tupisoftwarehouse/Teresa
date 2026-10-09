import "package:flutter/services.dart";
import "package:teresa/src/internals/value_objects/widget_style_value_objects/input_style_value_object.dart";
import "package:teresa/src/internals/value_objects/widget_style_value_objects/surface_style_value_object.dart";
import "package:teresa/src/teresa_theme/colors/danger_color.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";
import "package:teresa/src/teresa_theme/colors/primary_color.dart";
import "package:teresa/src/teresa_theme/colors/secondary_color.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/abstract/abstract_teresa_theme_value_object.dart";

class ConcreteDarkTeresaThemeValueObject
    implements AbstractTeresaThemeValueObject {
  @override
  final textEmphasis1Color = NeutralColor.VALUE_800;

  @override
  final textEmphasis2Color = NeutralColor.VALUE_700;

  @override
  final textEmphasis3Color = NeutralColor.VALUE_600;

  @override
  final textEmphasis4Color = NeutralColor.VALUE_500;

  @override
  final textEmphasis5Color = NeutralColor.VALUE_400;

  @override
  final textEmphasis6Color = NeutralColor.VALUE_300;

  @override
  final textEmphasis7Color = NeutralColor.VALUE_200;

  @override
  final textEmphasis8Color = NeutralColor.VALUE_100;

  @override
  final textEmphasis9Color = NeutralColor.VALUE_50;

  @override
  final iconEmphasis1Color = NeutralColor.VALUE_800;

  @override
  final iconEmphasis2Color = NeutralColor.VALUE_700;

  @override
  final iconEmphasis3Color = NeutralColor.VALUE_600;

  @override
  final iconEmphasis4Color = NeutralColor.VALUE_500;

  @override
  final iconEmphasis5Color = NeutralColor.VALUE_400;

  @override
  final iconEmphasis6Color = NeutralColor.VALUE_300;

  @override
  final iconEmphasis7Color = NeutralColor.VALUE_200;

  @override
  final iconEmphasis8Color = NeutralColor.VALUE_100;

  @override
  final iconEmphasis9Color = NeutralColor.VALUE_50;

  @override
  final input = InputStyleValueObject(
    NeutralColor.VALUE_50,
    NeutralColor.VALUE_500,
    NeutralColor.VALUE_800,
  );

  @override
  final textArea = InputStyleValueObject(
    NeutralColor.VALUE_50,
    NeutralColor.VALUE_400,
    NeutralColor.TRANSPARENT,
  );

  @override
  final selectedIndicatorColor = PrimaryColor.VALUE_800;

  @override
  final unselectedIconColor = NeutralColor.VALUE_500;

  @override
  final surface = SurfaceStyleValueObject(
    NeutralColor.VALUE_900,
    NeutralColor.TRANSPARENT,
  );

  @override
  final elevatedSurface = SurfaceStyleValueObject(
    NeutralColor.VALUE_900,
    NeutralColor.VALUE_700,
  );

  @override
  final tapIndicatorColor = NeutralColor.VALUE_50;

  @override
  final loadingIndicatorColor = SecondaryColor.VALUE_700;

  @override
  final navigationBarIndicatorColor = PrimaryColor.VALUE_800;

  @override
  final systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: NeutralColor.TRANSPARENT,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  );

  @override
  final debugModeBannerSurface = SurfaceStyleValueObject(
    DangerColor.VALUE_700,
    DangerColor.VALUE_500,
  );
}
