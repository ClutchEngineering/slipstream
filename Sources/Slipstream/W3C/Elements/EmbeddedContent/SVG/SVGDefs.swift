import SwiftSoup

/// A view that represents an SVG definitions container.
///
/// SVGDefs is used to define reusable elements like gradients, patterns, and symbols
/// that can be referenced by other SVG elements.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       SVG(viewBox: "0 0 24 24") {
///         SVGDefs {
///           SVGLinearGradient(id: "myGradient") {
///             SVGStop(offset: "0%", stopColor: "red")
///             SVGStop(offset: "100%", stopColor: "blue")
///           }
///         }
///         SVGPath("M12 0c-6.626 0-12 5.373-12 12...")
///           .fill("url(#myGradient)")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [defs](https://svgwg.org/svg2-draft/struct.html#DefsElement) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct SVGDefs<Content>: View where Content: View {
  /// Creates an SVG defs element.
  ///
  /// - Parameter content: The definitions to include (gradients, patterns, symbols, etc.).
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("defs")
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
}
