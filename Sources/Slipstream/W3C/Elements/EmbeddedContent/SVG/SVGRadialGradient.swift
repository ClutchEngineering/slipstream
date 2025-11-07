import Foundation
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
///           SVGRadialGradient(center: Point(x: 0.5, y: 0.5), radius: 0.5) {
///             SVGStop(offset: 0, color: .red)
///             SVGStop(offset: 1, color: .blue)
///           }
///           .id("radial1")
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
  ///   - center: The center point of the gradient (default: Point(x: 0.5, y: 0.5)).
  ///   - radius: Radius of the gradient (default: 0.5).
  ///   - focalPoint: The focal point of the gradient (optional).
  ///   - gradientUnits: Coordinate system for the gradient (default: .objectBoundingBox).
  ///   - content: The gradient stops that define the color transitions.
  public init(
    center: Point = Point(x: 0.5, y: 0.5),
    radius: Double = 0.5,
    focalPoint: Point? = nil,
    gradientUnits: GradientUnits = .objectBoundingBox,
    @ViewBuilder content: @escaping @Sendable () -> Content
  ) {
    self.center = center
    self.radius = radius
    self.focalPoint = focalPoint
    self.gradientUnits = gradientUnits
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("radialGradient")
    try element.attr("cx", gradientUnits.formatCoordinate(center.x))
    try element.attr("cy", gradientUnits.formatCoordinate(center.y))
    try element.attr("r", gradientUnits.formatCoordinate(radius))
    if let focalPoint = focalPoint {
      try element.attr("fx", gradientUnits.formatCoordinate(focalPoint.x))
      try element.attr("fy", gradientUnits.formatCoordinate(focalPoint.y))
    }
    try element.attr("gradientUnits", gradientUnits.stringValue)
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private let center: Point
  private let radius: Double
  private let focalPoint: Point?
  private let gradientUnits: GradientUnits
}
