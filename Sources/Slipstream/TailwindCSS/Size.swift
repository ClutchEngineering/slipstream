import Foundation

/// A structure that represents the edges of a rectangle, used for specifying
/// which sides to apply modifications to, such as padding or margin.
///
/// You'll typically work with a set of edges using the ``Edge/Set`` type.
@available(iOS 17.0, macOS 14.0, *)
public struct Size {
  /// Creates a size.
  /// 
  /// - Parameters:
  ///   - width: The width, in points.
  ///   - height: The height, in points.
  public init(width: Double, height: Double) {
    self.width = width
    self.height = height
  }

  let width: Double
  let height: Double

  var asPixels: String? {
    let formatter = NumberFormatter()
    formatter.maximumFractionDigits = 2
    guard let width = formatter.string(from: width as NSNumber),
          let height = formatter.string(from: height as NSNumber) else {
      return nil
    }
    return "\(width)px_\(height)px"
  }
}
