import SwiftSoup

/// A view that represents an SVG radial gradient definition.
///
/// SVGRadialGradient defines a radial gradient that can be used to fill or stroke SVG elements.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       SVG(viewBox: "0 0 100 100") {
///         SVGDefs {
///           SVGRadialGradient(id: "radial1", cx: "50%", cy: "50%", r: "50%") {
///             SVGStop(offset: "0%", stopColor: "#ff0000")
///             SVGStop(offset: "100%", stopColor: "#0000ff")
///           }
///         }
///         SVGPath("M10,10 L90,90")
///           .fill("url(#radial1)")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [radialGradient](https://svgwg.org/svg2-draft/pservers.html#RadialGradientElement) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct SVGRadialGradient<Content>: View where Content: View {
  /// Creates an SVG radial gradient element.
  ///
  /// - Parameters:
  ///   - id: Unique identifier for the gradient.
  ///   - cx: X coordinate of the gradient center (default: "50%").
  ///   - cy: Y coordinate of the gradient center (default: "50%").
  ///   - r: Radius of the gradient (default: "50%").
  ///   - fx: X coordinate of the focal point (optional).
  ///   - fy: Y coordinate of the focal point (optional).
  ///   - gradientUnits: Coordinate system for the gradient (default: "objectBoundingBox").
  ///   - content: The gradient stops that define the color transitions.
  public init(
    id: String,
    cx: String = "50%",
    cy: String = "50%",
    r: String = "50%",
    fx: String? = nil,
    fy: String? = nil,
    gradientUnits: String = "objectBoundingBox",
    @ViewBuilder content: @escaping @Sendable () -> Content
  ) {
    self.id = id
    self.cx = cx
    self.cy = cy
    self.r = r
    self.fx = fx
    self.fy = fy
    self.gradientUnits = gradientUnits
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("radialGradient")
    try element.attr("id", id)
    try element.attr("cx", cx)
    try element.attr("cy", cy)
    try element.attr("r", r)
    if let fx = fx {
      try element.attr("fx", fx)
    }
    if let fy = fy {
      try element.attr("fy", fy)
    }
    try element.attr("gradientUnits", gradientUnits)
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private let id: String
  private let cx: String
  private let cy: String
  private let r: String
  private let fx: String?
  private let fy: String?
  private let gradientUnits: String
}
