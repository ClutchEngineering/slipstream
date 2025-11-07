import Foundation
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
///           SVGLinearGradient {
///             SVGStop(offset: 0, color: .red)
///             SVGStop(offset: 0.5, color: .hex("#00ff00"), opacity: 0.8)
///             SVGStop(offset: 1, color: .blue)
///           }
///           .id("grad1")
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
  ///   - offset: Position of the stop along the gradient vector (0.0 to 1.0).
  ///   - color: Color of the gradient at this stop.
  ///   - opacity: Opacity of the color at this stop (0.0 to 1.0, default: 1.0).
  public init(offset: Double, color: SVGColor, opacity: Double = 1.0) {
    self.offset = offset
    self.color = color
    self.opacity = opacity
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("stop")
    try element.attr("offset", SVGFormatting.format(offset))
    try element.attr("stop-color", color.stringValue)
    if opacity < 1.0 {
      try element.attr("stop-opacity", SVGFormatting.format(opacity))
    }
  }

  private let offset: Double
  private let color: SVGColor
  private let opacity: Double
}
