import SwiftSoup

/// A view that represents an SVG circle element.
///
/// SVGCircle creates a circular shape within an SVG context.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       SVG(viewBox: "0 0 100 100") {
///         SVGCircle(cx: "50", cy: "50", r: "40")
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
  ///   - cx: X coordinate of the circle center.
  ///   - cy: Y coordinate of the circle center.
  ///   - r: Radius of the circle.
  public init(cx: String, cy: String, r: String) {
    self.cx = cx
    self.cy = cy
    self.r = r
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("circle")
    try element.attr("cx", cx)
    try element.attr("cy", cy)
    try element.attr("r", r)
  }

  private let cx: String
  private let cy: String
  private let r: String
}
