import Foundation
import SwiftSoup

/// Represents a group of columns within a table.
///
/// Use this element to group columns together, typically to apply styling or
/// properties to multiple columns at once.
///
/// ```swift
/// Table {
///   ColumnGroup {
///     Column()
///     Column()
///   }
/// }
/// ```
///
/// When used without content, you can specify a span to indicate the number of columns:
///
/// ```swift
/// Table {
///   ColumnGroup(span: 2)
/// }
/// ```
///
/// - SeeAlso: W3C [colgroup](https://html.spec.whatwg.org/multipage/tables.html#the-colgroup-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct ColumnGroup<Content>: View where Content: View {
  /// Creates a ColumnGroup view.
  ///
  /// - Parameters:
  ///   - span: The number of columns this group spans (only used when content is empty).
  ///   - content: The column definitions.
  public init(span: Int? = nil, @ViewBuilder content: @escaping @Sendable () -> Content) {
    self.span = span
    self.content = content
  }

  /// Creates an empty ColumnGroup view with a span.
  ///
  /// - Parameter span: The number of columns this group spans.
  public init(span: Int) where Content == EmptyView {
    self.span = span
    self.content = { EmptyView() }
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("colgroup")

    if let span {
      try element.attr("span", String(span))
    }

    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private let span: Int?
}
