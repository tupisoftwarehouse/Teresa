import "package:flutter/widgets.dart" hide Navigator;
import "package:teresa/src/navigator/abstract_navigator.dart";

class NavigatorMock implements AbstractNavigator {
  /// Executes when [navigate] is called.
  final void Function(BuildContext context, Widget screen)
  _navigateExecutorImplementation;

  /// Executes when [navigateBack] is called.
  final void Function(BuildContext context) _navigateBackExecutorImplementation;

  /// Creates a mock navigator with custom implementations for navigation
  /// operations.
  ///
  /// [_navigateExecutorImplementation] is called when [navigate] is invoked.
  /// [_navigateBackExecutorImplementation] is called when [navigateBack] is
  /// invoked.
  NavigatorMock(
    this._navigateExecutorImplementation,
    this._navigateBackExecutorImplementation,
  );

  @override
  void navigate(BuildContext context, Widget screen) {
    _navigateExecutorImplementation(context, screen);
  }

  @override
  void navigateBack(BuildContext context) {
    _navigateBackExecutorImplementation(context);
  }
}
