/// A view that isolates a span of text that might be formatted in a
/// different direction from other text outside it.
///
/// Use `BidirectionalIsolate` when embedding text with an unknown directionality
/// (such as user-generated content) into text with a known directionality. This
/// prevents the bidirectional algorithm from affecting the surrounding text.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Paragraph {
///       DOMString("User ")
///       BidirectionalIsolate(username)
///       DOMString(" posted a comment.")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`bdi`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-bdi-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct BidirectionalIsolate<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "bdi"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a BidirectionalIsolate view with custom content.
  ///
  /// - Parameter content: The content to be isolated.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a BidirectionalIsolate view with plain text.
  ///
  /// - Parameter text: The text content to be isolated.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
