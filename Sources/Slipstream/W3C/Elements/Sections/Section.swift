/// A view that represents a generic section of a document or application.
/// A section, in this context, is a thematic grouping of content, typically
/// with a heading.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Section {
///         Link("About", destination: URL(string: "/about"))
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Section<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "section"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Section view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
