import SwiftSoup

/// A view that represents an SVG linear gradient definition.
///
/// SVGLinearGradient defines a linear gradient that can be used to fill or stroke SVG elements.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       SVG(viewBox: "0 0 100 100") {
///         SVGDefs {
///           SVGLinearGradient(id: "grad1", x1: "0%", y1: "0%", x2: "100%", y2: "0%") {
///             SVGStop(offset: "0%", stopColor: "#ff0000")
///             SVGStop(offset: "100%", stopColor: "#0000ff")
///           }
///         }
///         SVGPath("M10,10 L90,90")
///           .stroke("url(#grad1)")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [linearGradient](https://svgwg.org/svg2-draft/pservers.html#LinearGradientElement) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct SVGLinearGradient<Content>: View where Content: View {
  /// Creates an SVG linear gradient element.
  ///
  /// - Parameters:
  ///   - id: Unique identifier for the gradient.
  ///   - x1: X coordinate of the gradient vector start point (default: "0%").
  ///   - y1: Y coordinate of the gradient vector start point (default: "0%").
  ///   - x2: X coordinate of the gradient vector end point (default: "100%").
  ///   - y2: Y coordinate of the gradient vector end point (default: "0%").
  ///   - gradientUnits: Coordinate system for the gradient (default: "objectBoundingBox").
  ///   - content: The gradient stops that define the color transitions.
  public init(
    id: String,
    x1: String = "0%", 
    y1: String = "0%", 
    x2: String = "100%", 
    y2: String = "0%",
    gradientUnits: String = "objectBoundingBox",
    @ViewBuilder content: @escaping @Sendable () -> Content
  ) {
    self.id = id
    self.x1 = x1
    self.y1 = y1
    self.x2 = x2
    self.y2 = y2
    self.gradientUnits = gradientUnits
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("linearGradient")
    try element.attr("id", id)
    try element.attr("x1", x1)
    try element.attr("y1", y1)
    try element.attr("x2", x2)
    try element.attr("y2", y2)
    try element.attr("gradientUnits", gradientUnits)
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private let id: String
  private let x1: String
  private let y1: String
  private let x2: String
  private let y2: String
  private let gradientUnits: String
}
