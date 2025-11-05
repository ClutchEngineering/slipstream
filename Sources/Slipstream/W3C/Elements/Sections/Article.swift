/// A view that represents a self-contained composition in a document, page,
/// application, or site, which is intended to be independently distributable
/// or reusable.
///
/// An article can be a forum post, a magazine or newspaper article, a blog entry,
/// a product card, a user-submitted comment, an interactive widget or gadget, or
/// any other independent item of content.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Article {
///         H1("Breaking News")
///         Paragraph("This is an independent article...")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [article](https://html.spec.whatwg.org/multipage/sections.html#the-article-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Article<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "article"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates an Article view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
