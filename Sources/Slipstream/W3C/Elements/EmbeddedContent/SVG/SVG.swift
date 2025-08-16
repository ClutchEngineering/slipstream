import SwiftSoup

/// A view that represents a Scalable Vector Graphics (SVG) container.
///
/// SVG provides a declarative way to include vector graphics in your document.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       SVG(viewBox: "0 0 24 24") {
///         Path("M12 0c-6.626 0-12 5.373-12 12...")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [svg](https://svgwg.org/svg2-draft/struct.html#SVGElement) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct SVG<Content>: View where Content: View {
  /// Creates an SVG view.
  ///
  /// - Parameters:
  ///   - viewBox: The SVG viewport coordinate system. Defines the position and dimension
  ///     of the user coordinate system. Format: "minX minY width height".
  ///   - content: The SVG content to render within this container.
  public init(viewBox: String, @ViewBuilder content: @escaping @Sendable () -> Content) {
    self.viewBox = viewBox
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("svg")
    try element.attr("viewBox", viewBox)
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private let viewBox: String
}
