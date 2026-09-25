import "dart:math";

import "package:flutter/widgets.dart";
import "package:teresa/src/device_language_string_data/device_language_string_data.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/concrete/concrete_dark_teresa_theme_value_object.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/concrete/concrete_light_teresa_theme_value_object.dart";
import "package:teresa/src/teresa_theme_data/teresa_theme_data.dart";

const SNACKBAR_AUTOMATIC_DISMISS_DURATION = Duration(milliseconds: 3000);

const TOOLTIP_SHOWING_DURATION = Duration(seconds: 1, milliseconds: 500);

const INDICATOR_BAR_ROTATION_ANGLE = 60 * pi / 180;

const WIDGET_PREVIEW_MAXIMUM_SIZE = 360.0;

const WIDGET_PRIMARY_TEXT = "WIDGET_PRIMARY_TEXT";

const WIDGET_SECONDARY_TEXT = "WIDGET_SECONDARY_TEXT";

const WIDGET_TOOLTIP_MESSAGE = "WIDGET_TOOLTIP_MESSAGE";

const WIDGET_ACCESSIBILITY_LABEL = "WIDGET_ACCESSIBILITY_LABEL";

final SCREEN_TO_BE_NAVIGATED = Container();

const HOME_SCREEN_KEY = Key("HOME_SCREEN");

final APPLICATION_HOME_SCREEN = Container(key: HOME_SCREEN_KEY);

const CONCRETE_ENGLISH_APPLICATION_LANGUAGE = "English";

const CONCRETE_PORTUGUESE_APPLICATION_LANGUAGE = "Portuguese";

const CONCRETE_FRENCH_APPLICATION_LANGUAGE = "French";

const CONCRETE_GERMAN_APPLICATION_LANGUAGE = "German";

const CONCRETE_ITALIAN_APPLICATION_LANGUAGE = "Italian";

const CONCRETE_SPANISH_APPLICATION_LANGUAGE = "Spanish";

final FOCUS_NODE = FocusNode();

const TEXT_FROM_USER_INTERACTION = "Lorem Ipsum";

const BACK_BUTTON_TOOLTIP_MESSAGE = "BACK_BUTTON_TOOLTIP_MESSAGE";

const BACK_BUTTON_ACCESSIBILITY_LABEL = "BACK_BUTTON_ACCESSIBILITY_LABEL";

const DROPDOWN_MENU_WIDTH = 0.0;

final TERESA_THEME = ConcreteLightTeresaThemeValueObject();

final TERESA_THEME_DATA = TeresaThemeData(
  lightThemeValueObject: ConcreteLightTeresaThemeValueObject(),
  darkThemeValueObject: ConcreteDarkTeresaThemeValueObject(),
);

final DEVICE_LANGUAGE_STRING_DATA = DeviceLanguageStringData(
  englishLanguageStringValueObject: CONCRETE_ENGLISH_APPLICATION_LANGUAGE,
  portugueseLanguageStringValueObject: CONCRETE_PORTUGUESE_APPLICATION_LANGUAGE,
  frenchLanguageStringValueObject: CONCRETE_FRENCH_APPLICATION_LANGUAGE,
  germanLanguageStringValueObject: CONCRETE_GERMAN_APPLICATION_LANGUAGE,
  italianLanguageStringValueObject: CONCRETE_ITALIAN_APPLICATION_LANGUAGE,
  spanishLanguageStringValueObject: CONCRETE_SPANISH_APPLICATION_LANGUAGE,
);

const INITIALIZED_OBJECT = "";

const APPLICATION_TITLE = "APPLICATION_TITLE";

const MEDIA_QUERY_DATA = MediaQueryData();
