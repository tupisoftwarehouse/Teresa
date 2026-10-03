import "package:teresa/src/constants/platform_constants.dart";
import "package:teresa/src/device_language_string_data/device_language_string_data.dart";

class CurrentDeviceLanguageStringSelector {
  CurrentDeviceLanguageStringSelector._();

  static T getCurrentDeviceLanguageStrings<T>(
    DeviceLanguageStringData deviceLanguageStringData,
    String currentDeviceLanguageCode,
  ) {
    switch (currentDeviceLanguageCode) {
      case PORTUGUESE_LANGUAGE_CODE:
        return deviceLanguageStringData.portugueseLanguageStringValueObject;
      case FRENCH_LANGUAGE_CODE:
        return deviceLanguageStringData.frenchLanguageStringValueObject;
      case GERMAN_LANGUAGE_CODE:
        return deviceLanguageStringData.germanLanguageStringValueObject;
      case ITALIAN_LANGUAGE_CODE:
        return deviceLanguageStringData.italianLanguageStringValueObject;
      case SPANISH_LANGUAGE_CODE:
        return deviceLanguageStringData.spanishLanguageStringValueObject;
      default:
        return deviceLanguageStringData.englishLanguageStringValueObject;
    }
  }
}
