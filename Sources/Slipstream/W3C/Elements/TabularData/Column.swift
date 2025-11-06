import Foundation
import SwiftSoup

/// Represents a column within a table.
///
/// Use this element to define column properties that apply to one or more columns
/// within a ``ColumnGroup`` or ``Table``.
///
/// ```swift
/// Table {
///   ColumnGroup {
///     Column()
///       .span(2)
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [col](https://html.spec.whatwg.org/multipage/tables.html#the-col-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Column: View {
  /// Creates a Column view.
  ///
  /// - Parameter span: The number of columns this element spans.
  public init(span: Int? = nil) {
    self.span = span
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("col")

    if let span {
      try element.attr("span", String(span))
    }
  }

  private let span: Int?
}
