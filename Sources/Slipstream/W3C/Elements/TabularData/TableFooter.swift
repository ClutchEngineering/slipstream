/// The HTML ``<tfoot>`` element.
///
/// Represents the table footer, which typically contains summary rows or totals.
/// Like other table elements, ``TableFooter`` must be used within a ``Table``.
///
/// ```swift
/// struct ProductsTable: View {
///   var body: some View {
///     Table {
///       TableHeader {
///         TableRow {
///           TableHeaderCell { DOMString("Product") }
///           TableHeaderCell { DOMString("Price") }
///         }
///       }
///       TableBody {
///         TableRow {
///           TableCell { DOMString("Widget") }
///           TableCell { DOMString("$10") }
///         }
///         TableRow {
///           TableCell { DOMString("Gadget") }
///           TableCell { DOMString("$20") }
///         }
///       }
///       TableFooter {
///         TableRow {
///           TableCell { DOMString("Total") }
///           TableCell { DOMString("$30") }
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [tfoot](https://html.spec.whatwg.org/multipage/tables.html#the-tfoot-element) specification.
public struct TableFooter<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "tfoot"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a table footer element.
  ///
  /// - Parameter content: The content to display in the table footer, typically ``TableRow`` elements.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
