import SwiftSoup

/// A view that displays an indicator showing the completion progress of a task.
///
/// The `ProgressView` represents an HTML `<progress>` element, which displays
/// progress towards completion of a task. It can be used to show determinate
/// progress (with a specific value) or indeterminate progress (when the value
/// is unknown).
///
/// ```swift
/// // Indeterminate progress (no value specified)
/// ProgressView()
///
/// // Determinate progress with default max (1.0)
/// ProgressView(value: 0.7)
///
/// // Custom value and max
/// ProgressView(value: 70, max: 100)
/// ```
///
/// - SeeAlso: W3C [progress](https://html.spec.whatwg.org/multipage/form-elements.html#the-progress-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct ProgressView: View {
  /// Creates a progress indicator.
  ///
  /// - Parameters:
  ///   - value: The current progress value. When `nil`, the progress indicator
  ///     is indeterminate, indicating that an activity is ongoing with no
  ///     indication of how long it is expected to take. When specified, the value
  ///     must be between 0 and `max`.
  ///   - max: The maximum value, representing task completion. When `nil`, the
  ///     W3C default of 1.0 is used, allowing you to specify values as percentages
  ///     (e.g., 0.7 for 70%). When specified, must be greater than 0.
  public init(value: Double? = nil, max: Double? = nil) {
    self.value = value
    self.max = max
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("progress")

    if let value {
      try element.attr("value", String(value))
    }
    if let max {
      try element.attr("max", String(max))
    }
  }

  private let value: Double?
  private let max: Double?
}
