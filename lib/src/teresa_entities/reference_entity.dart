import "package:flutter/foundation.dart";

/// Holds a mutable value and notifies an optional observer when the value
/// changes.
///
/// [T] represents the type of the value stored by this reference entity.
class ReferenceEntity<T> {
  late T _value;
  VoidCallback? _onValueChanged;

  /// The current value stored by this reference entity.
  T get value {
    return _value;
  }

  /// Updates the current value and notifies the registered observer, if any.
  set value(T updatedValue) {
    _value = updatedValue;

    _onValueChanged?.call();
  }

  /// Registers a callback to be invoked whenever [value] changes.
  ///
  /// Calling this method replaces any previously registered observer.
  void setObserver(VoidCallback updateOnValueChanged) {
    _onValueChanged = updateOnValueChanged;
  }
}
