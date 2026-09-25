import "package:flutter/widgets.dart" as widgets;

/// Defines an abstraction for navigating between screens in a Flutter
/// application.
///
/// Depend on this interface in services, controllers, or other application
/// layers that need to perform navigation without depending directly on
/// Flutter's platform-specific route implementations.
///
/// Use [ConcreteNavigator] for production navigation.
abstract class AbstractNavigator {
  /// Navigates to the given [screen].
  ///
  /// [context] is the [widgets.BuildContext] used to access the application's
  /// [widgets.Navigator].
  /// [screen] is the widget that will be displayed as the new route.
  void navigate(widgets.BuildContext context, widgets.Widget screen);

  /// Navigates back from the current screen.
  ///
  /// [context] is the [widgets.BuildContext] used to access the application's
  /// [widgets.Navigator].
  void navigateBack(widgets.BuildContext context);
}
