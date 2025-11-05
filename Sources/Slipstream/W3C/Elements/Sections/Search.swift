/// A view that represents a section containing search or filtering functionality.
///
/// The `search` element represents a part of a document or application that contains
/// a set of form controls or other content related to performing a search or filtering
/// operation.
///
/// ```swift
/// struct MySiteHeader: View {
///   var body: some View {
///     Search {
///       Form {
///         TextField("query", placeholder: "Search...")
///         Button("Search")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`search`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-search-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Search<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "search"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Search view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
