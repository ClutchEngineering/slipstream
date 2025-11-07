import SwiftSoup

/// A view that represents a MathML `<ms>` element for string literals.
///
/// The `<ms>` element is used to represent string literals in mathematical expressions.
/// By default, the content is displayed with surrounding quotes.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Math {
///         MRow {
///           MS("Hello")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [ms](https://www.w3.org/TR/MathML3/chapter3.html#presm.ms) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MS: View {
  private let text: String

  /// Creates an MS element with text content.
  ///
  /// - Parameter text: The string literal text content
  public init(_ text: String) {
    self.text = text
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("ms")
    try element.text(text)
  }
}
