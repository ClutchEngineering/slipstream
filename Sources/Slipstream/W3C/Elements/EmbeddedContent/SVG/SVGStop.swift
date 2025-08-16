import SwiftSoup

/// A view that represents an SVG gradient stop.
///
/// SVGStop defines a color and position within a gradient.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       SVG(viewBox: "0 0 100 100") {
///         SVGDefs {
///           SVGLinearGradient(id: "grad1") {
///             SVGStop(offset: "0%", stopColor: "#ff0000")
///             SVGStop(offset: "50%", stopColor: "#00ff00", stopOpacity: "0.8")
///             SVGStop(offset: "100%", stopColor: "#0000ff")
///           }
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [stop](https://svgwg.org/svg2-draft/pservers.html#StopElement) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct SVGStop: View {
  /// Creates an SVG stop element.
  ///
  /// - Parameters:
  ///   - offset: Position of the stop along the gradient vector (e.g., "0%", "50%", "1.0").
  ///   - stopColor: Color of the gradient at this stop.
  ///   - stopOpacity: Opacity of the color at this stop (optional, default: "1").
  public init(offset: String, stopColor: String, stopOpacity: String? = nil) {
    self.offset = offset
    self.stopColor = stopColor
    self.stopOpacity = stopOpacity
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("stop")
    try element.attr("offset", offset)
    try element.attr("stop-color", stopColor)
    if let stopOpacity = stopOpacity {
      try element.attr("stop-opacity", stopOpacity)
    }
  }

  private let offset: String
  private let stopColor: String
  private let stopOpacity: String?
}
