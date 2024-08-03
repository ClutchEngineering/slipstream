/// A view that represents a heading for a section.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       H3("Hello, world!")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`h1-h6`](https://html.spec.whatwg.org/multipage/sections.html#the-h1,-h2,-h3,-h4,-h5,-and-h6-elements) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct H3<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "h3"

  @_documentation(visibility: private)
  @ViewBuilder public let content: () -> Content

  /// Creates an H3 view.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  /// Creates an H3 view with some static text.
  public init(_ text: String) where Content == Text {
    self.content = {
      Text(text)
    }
  }
}
