/// A view that represents a header cell in a table.
///
/// - SeeAlso: W3C [th](https://html.spec.whatwg.org/multipage/tables.html#the-th-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct TableHeaderCell<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "th"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a table header cell.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
