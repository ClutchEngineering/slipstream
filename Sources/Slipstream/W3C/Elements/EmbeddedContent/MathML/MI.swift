import SwiftSoup

/// A view that represents a MathML `<mi>` element for identifiers.
///
/// The `<mi>` element is used to represent identifier symbols in mathematical expressions,
/// such as variable names or function names. By default, content is rendered in italic.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Math {
///         MRow {
///           MI("x")
///           MO("+")
///           MI("y")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [mi](https://www.w3.org/TR/MathML3/chapter3.html#presm.mi) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MI: View {
  private let text: String

  /// Creates an MI element with text content.
  ///
  /// - Parameter text: The identifier text content
  public init(_ text: String) {
    self.text = text
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("mi")
    try element.appendText(text)
  }
}
