/// A view that represents a section that is quoted from another source.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Blockquote {
///         DOMString("Hello, world!")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [blockquote](https://html.spec.whatwg.org/multipage/grouping-content.html#the-blockquote-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Blockquote<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "blockquote"

  @_documentation(visibility: private)
  @ViewBuilder public let content: () -> Content

  /// Creates a blockquote.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  /// Creates a blockquote with some static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
