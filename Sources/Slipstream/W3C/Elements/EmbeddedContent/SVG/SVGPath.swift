import SwiftSoup

/// A view that represents an SVG path element.
///
/// SVGPath defines a shape using a series of commands and parameters.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       SVG(viewBox: "0 0 24 24") {
///         SVGPath("M12 0c-6.626 0-12 5.373-12 12 0 6.627 5.374 12 12 12...")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [path](https://svgwg.org/svg2-draft/paths.html#PathElement) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct SVGPath: View {
  /// Creates a path element.
  ///
  /// - Parameter data: The path data string that defines the shape using SVG path commands.
  ///   Commands include M (move to), L (line to), C (curve to), Z (close path), etc.
  public init(_ data: String) {
    self.data = data
    self.transformValue = nil
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("path")
    try element.attr("d", data)
    if let transformValue = transformValue {
      try element.attr("transform", transformValue)
    }
  }

  /// Applies a transform attribute to this SVG path.
  ///
  /// - Parameter transform: The transform to apply.
  /// - Returns: A new SVGPath with the specified transform applied.
  public func transform(_ transform: Transform) -> SVGPath {
    var newPath = self
    newPath.transformValue = transform.stringValue
    return newPath
  }

  private let data: String
  private var transformValue: String?
}
