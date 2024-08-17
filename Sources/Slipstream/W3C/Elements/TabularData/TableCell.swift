/// A view that represents a data cell in a table.
///
/// - SeeAlso: W3C [td](https://html.spec.whatwg.org/multipage/tables.html#the-td-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct TableCell<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "td"

  @_documentation(visibility: private)
  @ViewBuilder public let content: () -> Content

  /// Creates a table cell.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }
}
