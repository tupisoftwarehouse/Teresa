/// Defines standardized animation durations used throughout Teresa.
///
/// Each static property exposes its corresponding [Duration].
///
/// The durations provide a consistent set of animation timing options for
/// Teresa's user interface components.
class AnimationDuration {
  AnimationDuration._();

  /// Represents an animation with no duration.
  static const Duration NONE = Duration.zero;

  /// Represents a short animation lasting 150 milliseconds.
  static const Duration SHORT = Duration(milliseconds: 150);

  /// Represents a medium animation lasting 350 milliseconds.
  static const Duration MEDIUM = Duration(milliseconds: 350);

  /// Represents a long animation lasting 500 milliseconds.
  static const Duration LONG = Duration(milliseconds: 500);
}
