/// A view that defines the document's metadata container.
///
/// Web pages use ``Head`` to define important metadata, such
/// as the web page's title, search engine metadata, and scripts/stylesheets.
///
/// ```swift
/// struct MySiteMetadata: View {
///   var body: some View {
///     Head {
///       // Add document metadata here.
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`head`](https://html.spec.whatwg.org/multipage/semantics.html#the-head-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Head<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "head"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Head view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
