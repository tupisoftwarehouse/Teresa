import "dart:io";

import "package:flutter/cupertino.dart" as cupertino;
import "package:flutter/material.dart" as material;
import "package:flutter/services.dart";
import "package:flutter/widgets.dart";
import "package:teresa/src/inherited_widgets/device_language_strings.dart";
import "package:teresa/src/internals/factories/device_language_string_manager_factory.dart";
import "package:teresa/src/internals/factories/teresa_theme_manager_factory.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/internals/managers/device_language_string_manager.dart";
import "package:teresa/src/device_language_string_data/device_language_string_data.dart";
import "package:teresa/src/teresa_theme_data/teresa_theme_data.dart";
import "package:teresa/src/internals/managers/teresa_theme_manager.dart";

/// Provides the root application configuration for a Teresa-based Flutter
/// application.
///
/// [TeresaApplication] initializes and provides the application's theme and
/// device-language strings through [TeresaTheme] and [DeviceLanguageStrings].
/// It also configures the underlying Flutter application according to the
/// current platform.
///
/// [themeData] contains the configuration used to create the Teresa theme
/// manager.
///
/// [deviceLanguageStringData] contains the language-specific data used to
/// create the device language string manager.
///
/// [home] is the initial widget displayed by the application.
///
/// The generic type [T] represents the type of the language-specific value
/// objects stored in [deviceLanguageStringData].
///
/// Example:
///
/// ```dart
/// TeresaApplication<MyStrings>(
///   title: "My Application",
///   themeData: TeresaThemeData(...),
///   deviceLanguageStringData: DeviceLanguageStringData(
///     englishLanguageStringValueObject: ...,
///     portugueseLanguageStringValueObject: ...,
///     frenchLanguageStringValueObject: ...,
///     germanLanguageStringValueObject: ...,
///     italianLanguageStringValueObject: ...,
///     spanishLanguageStringValueObject: ...,
///   ),
///   home: const HomeScreen(),
/// );
/// ```
class TeresaApplication<T> extends StatefulWidget {
  /// The title displayed by the underlying platform application.
  final String title;

  /// The configuration used to create and manage the application's Teresa
  /// theme.
  final TeresaThemeData themeData;

  /// The language-specific value objects used to manage device language
  /// strings.
  final DeviceLanguageStringData<T> deviceLanguageStringData;

  /// The initial widget displayed by the application.
  final Widget home;

  /// Creates a Teresa application with the given theme, language data, and
  /// initial screen.
  const TeresaApplication({
    super.key,
    required this.title,
    required this.themeData,
    required this.deviceLanguageStringData,
    required this.home,
  });

  @override
  State<StatefulWidget> createState() {
    return _TeresaApplicationState();
  }
}

class _TeresaApplicationState<T> extends State<TeresaApplication> {
  late final TeresaThemeManager _themeManager;
  late final DeviceLanguageStringManager<T> _deviceLanguageStringsManager;

  @override
  void initState() {
    super.initState();

    _themeManager = TeresaThemeManagerFactory.getInstance(widget.themeData);

    _deviceLanguageStringsManager =
        DeviceLanguageStringManagerFactory.getInstance<T>(
          widget.deviceLanguageStringData as DeviceLanguageStringData<T>,
        );
  }

  @override
  Widget build(BuildContext _) {
    return ValueListenableBuilder(
      valueListenable: _deviceLanguageStringsManager.deviceLanguageStrings,
      builder: (_, deviceLanguageStrings, _) {
        return DeviceLanguageStrings(
          deviceLanguageStrings: deviceLanguageStrings,
          child: ValueListenableBuilder(
            valueListenable: _themeManager.theme,
            builder: (_, theme, _) {
              return TeresaTheme(
                theme: theme,
                child: AnnotatedRegion<SystemUiOverlayStyle>(
                  value: theme.systemUiOverlayStyle,
                  child: Platform.isIOS || Platform.isMacOS
                      ? cupertino.CupertinoApp(
                          title: widget.title,
                          home: widget.home,
                        )
                      : material.MaterialApp(
                          title: widget.title,
                          theme: material.ThemeData(
                            pageTransitionsTheme: material.PageTransitionsTheme(
                              builders: {
                                TargetPlatform.android:
                                    material.PredictiveBackPageTransitionsBuilder(
                                      fallbackColor:
                                          theme.surface.backgroundColor,
                                    ),
                                TargetPlatform.fuchsia:
                                    material.PredictiveBackPageTransitionsBuilder(
                                      fallbackColor:
                                          theme.surface.backgroundColor,
                                    ),
                                TargetPlatform.linux:
                                    material.PredictiveBackPageTransitionsBuilder(
                                      fallbackColor:
                                          theme.surface.backgroundColor,
                                    ),
                                TargetPlatform.windows:
                                    material.PredictiveBackPageTransitionsBuilder(
                                      fallbackColor:
                                          theme.surface.backgroundColor,
                                    ),
                              },
                            ),
                          ),
                          home: widget.home,
                        ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
