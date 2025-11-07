import Foundation

/// Represents an SVG transform operation.
///
/// Transform defines the various ways to transform SVG elements including
/// translation, rotation, scaling, and skewing.
///
/// ```swift
/// SVGPath("M10,10 L50,50")
///   .transform(.translate(x: 10, y: 20))
///
/// SVGGroup {
///   SVGCircle(origin: CGPoint(x: 50, y: 50), radius: 25)
/// }
/// .transform(.rotate(angle: 45))
/// ```
///
/// - SeeAlso: W3C [transform](https://svgwg.org/svg2-draft/coords.html#TransformAttribute) specification.
@available(iOS 17.0, macOS 14.0, *)
public enum Transform: Sendable {
  /// Translates the element by the specified x and y values.
  case translate(x: Double, y: Double)
  
  /// Rotates the element by the specified angle in degrees.
  /// Optionally specify a center point for the rotation.
  case rotate(angle: Double, centerX: Double? = nil, centerY: Double? = nil)
  
  /// Scales the element by the specified factors.
  /// If only x is provided, y defaults to the same value.
  case scale(x: Double, y: Double? = nil)
  
  /// Skews the element along the x-axis by the specified angle in degrees.
  case skewX(angle: Double)
  
  /// Skews the element along the y-axis by the specified angle in degrees.
  case skewY(angle: Double)
  
  /// Applies a matrix transformation with the specified values.
  case matrix(a: Double, b: Double, c: Double, d: Double, e: Double, f: Double)
  
  /// Converts the transform to its SVG string representation.
  var stringValue: String {
    switch self {
    case .translate(let x, let y):
      return "translate(\(x),\(y))"
      
    case .rotate(let angle, let centerX, let centerY):
      if let cx = centerX, let cy = centerY {
        return "rotate(\(angle),\(cx),\(cy))"
      } else {
        return "rotate(\(angle))"
      }
      
    case .scale(let x, let y):
      if let y = y {
        return "scale(\(x),\(y))"
      } else {
        return "scale(\(x))"
      }
      
    case .skewX(let angle):
      return "skewX(\(angle))"
      
    case .skewY(let angle):
      return "skewY(\(angle))"
      
    case .matrix(let a, let b, let c, let d, let e, let f):
      return "matrix(\(a),\(b),\(c),\(d),\(e),\(f))"
    }
  }
}
