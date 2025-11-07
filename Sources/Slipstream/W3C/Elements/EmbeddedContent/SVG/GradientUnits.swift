import Foundation

/// Represents the coordinate system for SVG gradient elements.
///
/// GradientUnits defines how gradient coordinates should be interpreted.
///
/// - SeeAlso: W3C [gradientUnits](https://svgwg.org/svg2-draft/pservers.html#LinearGradientElementGradientUnitsAttribute) specification.
@available(iOS 17.0, macOS 14.0, *)
public enum GradientUnits: Sendable {
  /// Coordinates are relative to the bounding box of the element (0.0 to 1.0 range).
  /// This is the default and most common case.
  case objectBoundingBox
  
  /// Coordinates use the current user coordinate system (absolute values).
  case userSpaceOnUse
  
  /// Converts the gradient units to its SVG string representation.
  var stringValue: String {
    switch self {
    case .objectBoundingBox:
      return "objectBoundingBox"
    case .userSpaceOnUse:
      return "userSpaceOnUse"
    }
  }
  
  /// Formats a coordinate value according to the gradient units.
  ///
  /// - Parameter value: The coordinate value to format.
  /// - Returns: A formatted string representation suitable for SVG attributes.
  func formatCoordinate(_ value: Double) -> String {
    switch self {
    case .objectBoundingBox:
      // Convert to percentage
      let percentage = value * 100
      if percentage.truncatingRemainder(dividingBy: 1) == 0 {
        return "\(Int(percentage))%"
      }
      return "\(percentage)%"
    case .userSpaceOnUse:
      // Absolute value
      if value.truncatingRemainder(dividingBy: 1) == 0 {
        return String(Int(value))
      }
      return String(value)
    }
  }
}
