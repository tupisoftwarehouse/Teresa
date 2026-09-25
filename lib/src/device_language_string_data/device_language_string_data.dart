/// Groups the language-specific value objects used by Teresa for device-based
/// language selection.
///
/// The generic type [T] allows the same language data structure to be used with
/// different kinds of localized value objects.
///
/// Each language property contains the value object associated with that
/// language. Teresa can use this data to select the appropriate value based
/// on the device's current language.
///
/// Example:
///
/// ```dart
/// final data = DeviceLanguageStringData<String>(
///   englishLanguageStringValueObject: "Hello",
///   portugueseLanguageStringValueObject: "Olá",
///   frenchLanguageStringValueObject: "Bonjour",
///   germanLanguageStringValueObject: "Hallo",
///   italianLanguageStringValueObject: "Ciao",
///   spanishLanguageStringValueObject: "Hola",
/// );
/// ```
class DeviceLanguageStringData<T> {
  /// The value object used for English.
  final T englishLanguageStringValueObject;

  /// The value object used for Portuguese.
  final T portugueseLanguageStringValueObject;

  /// The value object used for French.
  final T frenchLanguageStringValueObject;

  /// The value object used for German.
  final T germanLanguageStringValueObject;

  /// The value object used for Italian.
  final T italianLanguageStringValueObject;

  /// The value object used for Spanish.
  final T spanishLanguageStringValueObject;

  /// Creates language-specific data containing a value object for each
  /// supported language.
  DeviceLanguageStringData({
    required this.englishLanguageStringValueObject,
    required this.portugueseLanguageStringValueObject,
    required this.frenchLanguageStringValueObject,
    required this.germanLanguageStringValueObject,
    required this.italianLanguageStringValueObject,
    required this.spanishLanguageStringValueObject,
  });
}
