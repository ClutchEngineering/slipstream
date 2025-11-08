import SwiftSoup

/// A view that represents a MathML `<mtext>` element for text content.
///
/// The `<mtext>` element is used to represent arbitrary text in mathematical expressions,
/// typically for annotations or labels.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Math {
///         MRow {
///           MI("x")
///           MO("=")
///           MN("5")
///           MText(" (inches)")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [mtext](https://www.w3.org/TR/MathML3/chapter3.html#presm.mtext) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MText: View {
  private let text: String

  /// Creates an MText element with text content.
  ///
  /// - Parameter text: The text content
  public init(_ text: String) {
    self.text = text
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("mtext")
    try element.appendText(text)
  }
}
