/// A view that represents strong importance, seriousness, or
/// urgency for its contents.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Strong("This is critical.")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`strong`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-strong-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Strong<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "strong"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Strong view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a Strong view with static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
