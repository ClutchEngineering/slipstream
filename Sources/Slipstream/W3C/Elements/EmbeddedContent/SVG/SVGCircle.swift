import SwiftSoup

/// A view that represents an SVG circle element.
///
/// SVGCircle renders a circular shape.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       SVG(viewBox: "0 0 100 100") {
///         SVGCircle(origin: Point(x: 50, y: 50), radius: 40)
///           .fill("#ff0000")
///           .stroke("#000000")
///           .strokeWidth("2")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [circle](https://svgwg.org/svg2-draft/shapes.html#CircleElement) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct SVGCircle: View {
  /// Creates an SVG circle element.
  ///
  /// - Parameters:
  ///   - origin: The center point of the circle.
  ///   - radius: The radius of the circle.
  public init(origin: Point, radius: Double) {
    self.origin = origin
    self.radius = radius
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("circle")
    try element.attr("cx", SVGFormatting.format(origin.x))
    try element.attr("cy", SVGFormatting.format(origin.y))
    try element.attr("r", SVGFormatting.format(radius))
  }

  private let origin: Point
  private let radius: Double
}
