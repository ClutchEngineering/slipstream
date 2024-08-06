/// A view that represents the footer of a document (as opposed to the document’s metadata).
///
///  A footer typically contains information about its section such as who wrote it, links to
///  related documents, copyright data, and the like.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Footer("Copyright 2024")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`footer`](https://html.spec.whatwg.org/multipage/sections.html#the-footer-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Footer<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "footer"

  @_documentation(visibility: private)
  @ViewBuilder public let content: () -> Content

  /// Creates a footer.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }
}
