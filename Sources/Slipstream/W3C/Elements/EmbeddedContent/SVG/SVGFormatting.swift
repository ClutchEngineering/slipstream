import Foundation

/// Formatting utilities for SVG attribute values.
@available(iOS 17.0, macOS 14.0, *)
enum SVGFormatting {
  /// Formats a numeric value for use in SVG attributes.
  ///
  /// This function formats numbers to remove unnecessary decimal points,
  /// producing cleaner SVG output. Integer values are rendered without
  /// decimals (e.g., `50` instead of `50.0`).
  ///
  /// - Parameter value: The numeric value to format.
  /// - Returns: A string representation of the value suitable for SVG attributes.
  static func format(_ value: Double) -> String {
    if value.truncatingRemainder(dividingBy: 1) == 0 {
      return String(Int(value))
    }
    return String(value)
  }
}
