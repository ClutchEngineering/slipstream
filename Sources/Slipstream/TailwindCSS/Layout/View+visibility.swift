import Foundation

/// Utilities for controlling the visibility of an element.
///
/// - SeeAlso: Tailwind CSS [visibility](https://tailwindcss.com/docs/visibility)
@available(iOS 17.0, macOS 14.0, *)
public enum Visibility: String {
  /// Sets `visibility: visible` - makes the element visible.
  case visible

  /// Sets `visibility: hidden` - hides the element but still takes up space in the layout.
  case invisible

  /// Sets `visibility: collapse` - collapses the element (primarily for table rows/columns).
  case collapse
}

@available(iOS 17.0, macOS 14.0, *)
extension View {
  /// Sets the visibility of an element.
  ///
  /// - Parameters:
  ///   - visibility: The visibility mode to apply.
  ///   - condition: An optional condition that controls when this modifier is applied.
  ///
  /// ```swift
  /// Div {
  ///   Text("This is visible")
  /// }
  /// .visibility(.visible)
  /// ```
  ///
  /// - SeeAlso: Tailwind CSS [visibility](https://tailwindcss.com/docs/visibility)
  public func visibility(_ visibility: Visibility, condition: Condition? = nil) -> some View {
    return modifier(TailwindClassModifier(add: visibility.rawValue, condition: condition))
  }
}
