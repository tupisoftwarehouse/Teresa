import "package:flutter/widgets.dart" hide Orientation;
import "package:teresa/src/orientation/orientation.dart";
import "package:teresa/src/teresa_theme/teresa_theme_value_object/abstract/abstract_teresa_theme_value_object.dart";

bool isOrientationHorizontal(Orientation orientation) {
  return orientation == Orientation.HORIZONTAL;
}

bool isObjectNotInitialized(dynamic object) {
  return object == null;
}

bool isThemeUpdated(
  AbstractTeresaThemeValueObject currentThemeValueObject,
  AbstractTeresaThemeValueObject oldThemeValueObject,
) {
  return currentThemeValueObject != oldThemeValueObject;
}

bool isDeviceLanguageStringsUpdated<T>(
  T currentDeviceSpecificStringsValueObject,
  T oldDeviceSpecificStringsValueObject,
) {
  return currentDeviceSpecificStringsValueObject !=
      oldDeviceSpecificStringsValueObject;
}

bool isApplicationResumed(AppLifecycleState appLifecycleState) {
  return appLifecycleState == AppLifecycleState.resumed;
}

bool isMediaQueryDataSpecified(MediaQueryData? mediaQueryData) {
  return mediaQueryData != null;
}

bool isDeviceLanguageStringsSpecified<T>(T? deviceLanguageStrings) {
  return deviceLanguageStrings != null;
}
