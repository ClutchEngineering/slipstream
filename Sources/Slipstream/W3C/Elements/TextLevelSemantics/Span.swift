/// A view that doesn't mean anything on its own, but can be
/// useful when used together with the global attributes, e.g.
/// class, lang, or dir. It represents its children.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Span("Hello, world!")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`span`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-span-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Span<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "span"

  @_documentation(visibility: private)
  @ViewBuilder public let content: () -> Content

  /// Creates a span.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  /// Creates a span with static text.
  public init(_ text: String) where Content == Text {
    self.content = {
      Text(text)
    }
  }
}
