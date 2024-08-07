/// A view that represents a fragment of computer code.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Code("print(helloWorld)")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`code`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-code-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Code<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "code"

  @_documentation(visibility: private)
  @ViewBuilder public let content: () -> Content

  /// Creates a code view.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  /// Creates a code view with static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
