/// A view that represents subscript text.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         DOMString("H")
///         Subscript("2")
///         DOMString("O")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`sub`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-sub-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Subscript<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "sub"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Subscript view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a Subscript view with static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
