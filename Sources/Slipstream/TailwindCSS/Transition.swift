/// A representation of the CSS properties that should transition.
public enum Transition: String {
  /// Transitions nothing.
  case none = "-none"

  /// Transitions all CSS properties that can be transformed.
  case all = "-all"

  /// Transitions color, background-color, border-color, text-decoration-color, fill, stroke, opacity, box-shadow, transform, filter, and backdrop-filter.
  case `default` = ""

  /// Transitions color, background-color, border-color, text-decoration-color, fill, and stroke.
  case colors = "-colors"

  /// Transitions opacity.
  case opacity = "-opacity"

  /// Transitions box-shadow.
  case shadow = "-shadow"

  /// Transitions transform.
  case transform = "-transform"
}
