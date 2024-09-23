import SwiftSoup

/// A view that represents a data cell in a table.
///
/// - SeeAlso: W3C [td](https://html.spec.whatwg.org/multipage/tables.html#the-td-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct TableCell<Content>: View where Content: View {
  /// Creates a table cell.
  public init(rowSpan: Int? = nil, colSpan: Int? = nil, @ViewBuilder content: @escaping () -> Content) {
    self.content = content
    self.rowSpan = rowSpan
    self.colSpan = colSpan
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("td")
    if let rowSpan {
      try element.attr("rowspan", "\(rowSpan)")
    }
    if let colSpan {
      try element.attr("colspan", "\(colSpan)")
    }
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: () -> Content
  private let rowSpan: Int?
  private let colSpan: Int?
}
