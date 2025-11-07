import SwiftSoup

/// A control that allows the user to select a value from a range.
///
/// This represents an HTML range input element that provides a slider
/// interface for selecting a numeric value within a specified range.
///
/// ```swift
/// // Basic slider with default range (0-100)
/// Slider()
///
/// // Slider with custom range
/// Slider(min: 0, max: 10)
///
/// // Slider with initial value and step
/// Slider(value: 5, min: 0, max: 100, step: 5)
///
/// // Slider with form association
/// Slider(name: "volume", value: 50, min: 0, max: 100)
/// ```
///
/// - SeeAlso: W3C [input type="range"](https://html.spec.whatwg.org/multipage/input.html#range-state-(type=range)) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Slider: View {
  /// Creates a slider input.
  ///
  /// - Parameters:
  ///   - name: The name of the form control, as used in form submission.
  ///   - value: The default numeric value of the slider. If not specified,
  ///     the default is the midpoint between min and max.
  ///   - min: The minimum value of the range. Defaults to 0.
  ///   - max: The maximum value of the range. Defaults to 100.
  ///   - step: The granularity of the value. If not specified, defaults to 1.
  ///   - id: The unique identifier for the slider, used for label association.
  ///   - autoFocus: If true, indicates that the slider should be focused as soon as
  ///     the page is loaded, allowing the user to interact with it without having to
  ///     manually focus it first.
  public init(name: String? = nil, value: Double? = nil, min: Double = 0, max: Double = 100, step: Double? = nil, id: String? = nil, autoFocus: Bool = false) {
    self.name = name
    self.value = value
    self.min = min
    self.max = max
    self.step = step
    self.id = id
    self.autoFocus = autoFocus
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("input")
    try element.attr("type", "range")

    if let name {
      try element.attr("name", name)
    }
    if let value {
      try element.attr("value", String(value))
    }
    try element.attr("min", String(min))
    try element.attr("max", String(max))
    if let step {
      try element.attr("step", String(step))
    }
    if let id {
      try element.attr("id", id)
    }
    if autoFocus {
      try element.attr("autofocus", "")
    }
  }

  private let name: String?
  private let value: Double?
  private let min: Double
  private let max: Double
  private let step: Double?
  private let id: String?
  private let autoFocus: Bool
}
