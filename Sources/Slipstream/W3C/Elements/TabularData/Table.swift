/// A view that represents data with more than one dimension, in
/// the form of a table.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Table {
///         DOMString("Hello, world!")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [table](https://html.spec.whatwg.org/multipage/tables.html#the-table-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Table<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "table"

  @_documentation(visibility: private)
  @ViewBuilder public let content: () -> Content

  /// Creates a table.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }
}
