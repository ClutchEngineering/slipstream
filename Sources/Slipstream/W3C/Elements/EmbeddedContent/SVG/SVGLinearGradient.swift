import Foundation
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
///           SVGLinearGradient(start: Point(x: 0, y: 0), end: Point(x: 1, y: 0)) {
///             SVGStop(offset: 0, color: .red)
///             SVGStop(offset: 1, color: .blue)
///           }
///           .id("grad1")
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
  ///   - start: The start point of the gradient vector (default: Point(x: 0, y: 0)).
  ///   - end: The end point of the gradient vector (default: Point(x: 1, y: 0)).
  ///   - gradientUnits: Coordinate system for the gradient (default: .objectBoundingBox).
  ///   - content: The gradient stops that define the color transitions.
  public init(
    start: Point = Point(x: 0, y: 0),
    end: Point = Point(x: 1, y: 0),
    gradientUnits: GradientUnits = .objectBoundingBox,
    @ViewBuilder content: @escaping @Sendable () -> Content
  ) {
    self.start = start
    self.end = end
    self.gradientUnits = gradientUnits
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("linearGradient")
    try element.attr("x1", gradientUnits.formatCoordinate(start.x))
    try element.attr("y1", gradientUnits.formatCoordinate(start.y))
    try element.attr("x2", gradientUnits.formatCoordinate(end.x))
    try element.attr("y2", gradientUnits.formatCoordinate(end.y))
    try element.attr("gradientUnits", gradientUnits.stringValue)
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private let start: Point
  private let end: Point
  private let gradientUnits: GradientUnits
}
