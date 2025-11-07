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
public struct MS<ChildContent: View>: W3CElement {
  public let tagName = "ms"

  @ViewBuilder public let content: @Sendable () -> ChildContent

  /// Creates an MS element with view content.
  ///
  /// - Parameter content: The view content for the string literal
  public init(@ViewBuilder content: @escaping @Sendable () -> ChildContent) {
    self.content = content
  }
}

@available(iOS 17.0, macOS 14.0, *)
extension MS where ChildContent == DOMString {
  /// Creates an MS element with text content.
  ///
  /// - Parameter text: The string literal text content
  public init(_ text: String) {
    self.content = {
      DOMString(text)
    }
  }
}
