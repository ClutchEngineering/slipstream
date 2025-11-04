/// A view that represents a caption for a table.
///
/// ```swift
/// struct ProductsTable: View {
///   var body: some View {
///     Table {
///       Caption("Products and Prices")
///       TableBody {
///         TableRow {
///           TableCell { DOMString("Widget") }
///           TableCell { DOMString("$10") }
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`caption`](https://html.spec.whatwg.org/multipage/tables.html#the-caption-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Caption<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "caption"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a table caption.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a table caption with some static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
