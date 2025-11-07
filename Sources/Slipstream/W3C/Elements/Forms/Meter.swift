import SwiftSoup

/// A view that represents a scalar measurement within a known range, or a fractional value.
///
/// The Meter element represents a gauge showing the current level of a measurement
/// within a known range. This is appropriate for things like disk usage, vote counts,
/// or progress that has a defined maximum. For progress bars that don't have a known
/// maximum, use a progress bar instead.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         DOMString("Disk usage: ")
///         Meter(value: 0.75, min: 0, max: 1, low: 0.3, high: 0.9, optimum: 0.2)
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`meter`](https://html.spec.whatwg.org/multipage/form-elements.html#the-meter-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Meter<Content>: View where Content: View {
  /// Creates a Meter view with a value and optional range boundaries.
  ///
  /// - Parameters:
  ///   - value: The current value of the meter.
  ///   - min: The lower numeric bound of the measured range. Default is `0`.
  ///   - max: The upper numeric bound of the measured range. Default is `1`.
  ///   - low: The upper numeric bound of the low end of the measured range.
  ///   - high: The lower numeric bound of the high end of the measured range.
  ///   - optimum: The optimal numeric value.
  ///   - content: Optional fallback content for browsers that don't support the meter element.
  public init(
    value: Double,
    min: Double = 0,
    max: Double = 1,
    low: Double? = nil,
    high: Double? = nil,
    optimum: Double? = nil,
    @ViewBuilder content: @escaping @Sendable () -> Content = { EmptyView() }
  ) {
    self.value = value
    self.min = min
    self.max = max
    self.low = low
    self.high = high
    self.optimum = optimum
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("meter")

    try element.attr("value", String(value))
    try element.attr("min", String(min))
    try element.attr("max", String(max))

    if let low {
      try element.attr("low", String(low))
    }

    if let high {
      try element.attr("high", String(high))
    }

    if let optimum {
      try element.attr("optimum", String(optimum))
    }

    try self.content().render(element, environment: environment)
  }

  private let value: Double
  private let min: Double
  private let max: Double
  private let low: Double?
  private let high: Double?
  private let optimum: Double?
  @ViewBuilder private let content: @Sendable () -> Content
}
