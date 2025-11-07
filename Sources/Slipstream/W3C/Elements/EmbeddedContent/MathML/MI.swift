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
public struct MI<ChildContent: View>: W3CElement {
  public let tagName = "mi"

  @ViewBuilder public let content: @Sendable () -> ChildContent

  /// Creates an MI element with view content.
  ///
  /// - Parameter content: The view content for the identifier
  public init(@ViewBuilder content: @escaping @Sendable () -> ChildContent) {
    self.content = content
  }
}

@available(iOS 17.0, macOS 14.0, *)
extension MI where ChildContent == DOMString {
  /// Creates an MI element with text content.
  ///
  /// - Parameter text: The identifier text content
  public init(_ text: String) {
    self.content = {
      DOMString(text)
    }
  }
}
