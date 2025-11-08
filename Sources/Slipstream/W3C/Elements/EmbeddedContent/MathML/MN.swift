import SwiftSoup

/// A view that represents a MathML `<mn>` element for numbers.
///
/// The `<mn>` element is used to represent numeric literals in mathematical expressions.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Math {
///         MRow {
///           MN("42")
///           MO("+")
///           MN("3.14")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [mn](https://www.w3.org/TR/MathML3/chapter3.html#presm.mn) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MN: View {
  private let text: String

  /// Creates an MN element with text content.
  ///
  /// - Parameter text: The number text content
  public init(_ text: String) {
    self.text = text
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("mn")
    try element.appendText(text)
  }
}
