/// A view that represents a row of cells in a table.
///
/// - SeeAlso: W3C [tr](https://html.spec.whatwg.org/multipage/tables.html#the-tr-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct TableRow<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "tr"

  @_documentation(visibility: private)
  @ViewBuilder public let content: () -> Content

  /// Creates a table row.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }
}
