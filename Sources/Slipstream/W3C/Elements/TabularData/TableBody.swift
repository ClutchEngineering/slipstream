/// A view that represents a block of rows that consist of a body of
/// data for the parent table view, if the ``TableBody`` has a
/// parent and it is a table.
///
/// - SeeAlso: W3C [tbody](https://html.spec.whatwg.org/multipage/tables.html#the-tbody-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct TableBody<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "tbody"

  @_documentation(visibility: private)
  @ViewBuilder public let content: () -> Content

  /// Creates a table body.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }
}
