import Foundation
import SwiftSoup

/// Represents an SVG `<rect>` element for rendering rectangles.
@available(iOS 17.0, macOS 14.0, *)
public struct SVGRect: View {
  private let origin: Point
  private let size: Size
  private let radiusX: Double?
  private let radiusY: Double?

  /// Creates an SVG rectangle.
  /// - Parameters:
  ///   - origin: The top-left corner of the rectangle (default: .zero)
  ///   - size: The dimensions of the rectangle
  ///   - radiusX: The x-axis radius of the ellipse used to round off the corners (optional)
  ///   - radiusY: The y-axis radius of the ellipse used to round off the corners (optional)
  public init(origin: Point = .zero, size: Size, radiusX: Double? = nil, radiusY: Double? = nil) {
    self.origin = origin
    self.size = size
    self.radiusX = radiusX
    self.radiusY = radiusY
  }

  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("rect")
    try element.attr("x", SVGFormatting.format(origin.x))
    try element.attr("y", SVGFormatting.format(origin.y))
    try element.attr("width", SVGFormatting.format(size.width))
    try element.attr("height", SVGFormatting.format(size.height))
    
    if let rx = radiusX {
      try element.attr("rx", SVGFormatting.format(rx))
    }
    if let ry = radiusY {
      try element.attr("ry", SVGFormatting.format(ry))
    }
  }
}
