import SwiftSoup

/// A view that represents a MathML `<mtd>` element for table cells.
///
/// The `<mtd>` element is used to represent a cell in a MathML table row (mtr).
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Math {
///         MTable {
///           MTr {
///             MTd {
///               MN("1")
///             }
///             MTd {
///               MN("2")
///             }
///           }
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [mtd](https://www.w3.org/TR/MathML3/chapter3.html#presm.mtd) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MTd<Content>: View where Content: View {
  /// Creates an MTd element.
  ///
  /// - Parameter content: The content of the table cell.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("mtd")
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
}
