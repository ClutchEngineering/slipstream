/// A view that represents the block of rows that consist of the column
/// labels (headers) and any ancillary non-header cells for the parent
/// table element, if the view has a parent and it is a table.
///
/// - SeeAlso: W3C [thead](https://html.spec.whatwg.org/multipage/tables.html#the-thead-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct TableHeader<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "thead"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a table header.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
