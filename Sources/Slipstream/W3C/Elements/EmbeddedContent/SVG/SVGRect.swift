import SwiftSoup

/// Represents an SVG `<rect>` element for rendering rectangles.
@available(iOS 17.0, macOS 14.0, *)
public struct SVGRect: View {
  private let x: String
  private let y: String
  private let width: String
  private let height: String
  private let radiusX: String?
  private let radiusY: String?

  /// Creates an SVG rectangle.
  /// - Parameters:
  ///   - x: The x-coordinate of the rectangle's left edge
  ///   - y: The y-coordinate of the rectangle's top edge
  ///   - width: The width of the rectangle
  ///   - height: The height of the rectangle
  ///   - rx: The x-axis radius of the ellipse used to round off the corners (optional)
  ///   - ry: The y-axis radius of the ellipse used to round off the corners (optional)
  public init(x: String = "0", y: String = "0", width: String, height: String, rx: String? = nil, ry: String? = nil) {
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.radiusX = rx
    self.radiusY = ry
  }

  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("rect")
    try element.attr("x", x)
    try element.attr("y", y)
    try element.attr("width", width)
    try element.attr("height", height)
    
    if let rx = radiusX {
      try element.attr("rx", rx)
    }
    if let ry = radiusY {
      try element.attr("ry", ry)
    }
  }
}
