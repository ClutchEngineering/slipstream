/// A view that represents a paragraph.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph("Hello, world!")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`p`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-p-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Paragraph<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "p"

  @_documentation(visibility: private)
  @ViewBuilder public let content: () -> Content

  /// Creates a paragraph.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  /// Creates an paragraph with some static text.
  public init(_ text: String) where Content == Text {
    self.content = {
      Text(text)
    }
  }
}
