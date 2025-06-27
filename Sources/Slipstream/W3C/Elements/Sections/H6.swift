/// A view that represents a heading for a section.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       H6("Hello, world!")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`h1-h6`](https://html.spec.whatwg.org/multipage/sections.html#the-h1,-h2,-h3,-h4,-h5,-and-h6-elements) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct H6<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "h6"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates an H6 view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates an H6 view with some static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
