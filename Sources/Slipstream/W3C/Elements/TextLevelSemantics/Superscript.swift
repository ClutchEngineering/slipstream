/// A view that represents superscript text.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         DOMString("E = mc")
///         Superscript("2")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`sup`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-sup-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Superscript<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "sup"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Superscript view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a Superscript view with static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
