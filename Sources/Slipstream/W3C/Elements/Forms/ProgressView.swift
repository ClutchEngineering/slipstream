import SwiftSoup

/// A view that represents the completion progress of a task.
///
/// The progress element displays a progress indicator showing how much of a task
/// has been completed. It can show either a determinate progress (with a specific
/// value) or an indeterminate progress (when the value is unknown).
///
/// ```swift
/// // Indeterminate progress
/// ProgressView()
///
/// // Determinate progress (50%)
/// ProgressView(value: 0.5)
///
/// // Custom maximum value (70 out of 100)
/// ProgressView(value: 70, max: 100)
///
/// // With ID for styling or scripting
/// ProgressView(value: 0.75, id: "upload-progress")
/// ```
///
/// - SeeAlso: W3C [`progress`](https://html.spec.whatwg.org/multipage/form-elements.html#the-progress-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct ProgressView: View {
  /// Creates a progress view.
  ///
  /// - Parameters:
  ///   - value: The current progress value. If nil, the progress is indeterminate.
  ///   - max: The maximum value, representing completion. Defaults to 1.0.
  ///   - id: The unique identifier for the progress element.
  public init(value: Double? = nil, max: Double = 1.0, id: String? = nil) {
    self.value = value
    self.max = max
    self.id = id
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("progress")

    if let value {
      try element.attr("value", String(value))
    }

    // Only add max attribute if it's not the default value of 1.0
    if max != 1.0 {
      try element.attr("max", String(max))
    }

    if let id {
      try element.attr("id", id)
    }
  }

  private let value: Double?
  private let max: Double
  private let id: String?
}
