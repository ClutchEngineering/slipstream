import Foundation

/// A type-safe representation of SVG colors.
///
/// SVGColor provides a Swift-friendly way to specify colors for SVG elements,
/// supporting hex values, RGB(A), named colors, and special SVG color values.
///
/// ```swift
/// // Using static colors
/// SVGStop(offset: 0, color: .red)
///
/// // Using hex values
/// SVGStop(offset: 0.5, color: .hex("#00ff00"))
///
/// // Using RGB
/// SVGStop(offset: 1, color: .rgb(0, 0, 255))
///
/// // With opacity
/// SVGStop(offset: 0.5, color: .rgba(255, 0, 0, 0.5))
/// ```
@available(iOS 17.0, macOS 14.0, *)
public struct SVGColor: Sendable {
  // MARK: - Static Color Conveniences
  
  /// Black color (#000000)
  public static let black = SVGColor("#000000")
  
  /// White color (#ffffff)
  public static let white = SVGColor("#ffffff")
  
  /// Red color (#ff0000)
  public static let red = SVGColor("#ff0000")
  
  /// Green color (#00ff00)
  public static let green = SVGColor("#00ff00")
  
  /// Blue color (#0000ff)
  public static let blue = SVGColor("#0000ff")
  
  /// Yellow color (#ffff00)
  public static let yellow = SVGColor("#ffff00")
  
  /// Cyan color (#00ffff)
  public static let cyan = SVGColor("#00ffff")
  
  /// Magenta color (#ff00ff)
  public static let magenta = SVGColor("#ff00ff")
  
  /// Transparent color
  public static let transparent = SVGColor("transparent")
  
  /// Current color (inherits from parent)
  public static let currentColor = SVGColor("currentColor")
  
  // MARK: - Initializers
  
  /// Creates a color from a hex string.
  ///
  /// - Parameter value: A hex color string (e.g., "#ff0000" or "#f00")
  /// - Returns: An SVGColor representing the hex value
  public static func hex(_ value: String) -> SVGColor {
    return SVGColor(value)
  }
  
  /// Creates a color from RGB values.
  ///
  /// - Parameters:
  ///   - r: Red component (0-255)
  ///   - g: Green component (0-255)
  ///   - b: Blue component (0-255)
  /// - Returns: An SVGColor representing the RGB value
  public static func rgb(_ r: Int, _ g: Int, _ b: Int) -> SVGColor {
    return SVGColor("rgb(\(r),\(g),\(b))")
  }
  
  /// Creates a color from RGBA values.
  ///
  /// - Parameters:
  ///   - r: Red component (0-255)
  ///   - g: Green component (0-255)
  ///   - b: Blue component (0-255)
  ///   - a: Alpha component (0.0-1.0)
  /// - Returns: An SVGColor representing the RGBA value
  public static func rgba(_ r: Int, _ g: Int, _ b: Int, _ a: Double) -> SVGColor {
    return SVGColor("rgba(\(r),\(g),\(b),\(a))")
  }
  
  /// Creates a color from a named color string.
  ///
  /// - Parameter name: A named SVG color (e.g., "red", "blue", "transparent")
  /// - Returns: An SVGColor representing the named color
  public static func named(_ name: String) -> SVGColor {
    return SVGColor(name)
  }
  
  // MARK: - Private Implementation
  
  private let value: String
  
  private init(_ value: String) {
    self.value = value
  }
  
  /// Returns the string representation of the color for SVG attributes.
  var stringValue: String {
    return value
  }
}
