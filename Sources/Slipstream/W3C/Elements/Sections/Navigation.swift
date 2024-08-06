/// A view that represents a section of a page that links to other pages or to
/// parts within the page: a section with navigation links.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Navigation {
///         Link("About", destination: URL(string: "/about"))
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`nav`](https://html.spec.whatwg.org/multipage/sections.html#the-nav-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Navigation<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "nav"

  @_documentation(visibility: private)
  @ViewBuilder public let content: () -> Content

  /// Creates a Navigation view.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }
}
