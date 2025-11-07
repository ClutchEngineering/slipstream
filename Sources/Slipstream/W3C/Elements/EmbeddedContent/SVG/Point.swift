import Foundation

/// A structure that represents a point in two-dimensional space.
///
/// Point is used to specify coordinates for SVG elements.
@available(iOS 17.0, macOS 14.0, *)
public struct Point: Sendable {
  /// Creates a point.
  /// 
  /// - Parameters:
  ///   - x: The x-coordinate, in points.
  ///   - y: The y-coordinate, in points.
  public init(x: Double, y: Double) {
    self.x = x
    self.y = y
  }

  public let x: Double
  public let y: Double
  
  /// A point at the origin (0, 0).
  public static let zero = Point(x: 0, y: 0)
}
