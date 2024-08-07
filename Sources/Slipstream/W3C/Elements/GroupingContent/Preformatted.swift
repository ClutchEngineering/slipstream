/// A view that represents a block of preformatted text.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Preformatted("""
/// print("Hello, world!")
/// """)
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`pre`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-pre-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Preformatted<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "pre"

  @_documentation(visibility: private)
  @ViewBuilder public let content: () -> Content

  /// Creates a preformatted view.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  /// Creates a preformatted view with some static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
