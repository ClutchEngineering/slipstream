/// A view that represents text that should be stylistically offset from normal
/// prose without conveying any special importance or emphasis.
///
/// The `<b>` element is useful for drawing attention to text without implying
/// greater importance, such as keywords in a document abstract, product names
/// in a review, or other spans of text whose typical presentation would be boldfaced.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Bold("Attention:") + " Please read the instructions carefully."
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`b`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-b-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Bold<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "b"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Bold view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a Bold view with static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
