import SwiftSoup

/// A view that represents a MathML `<mtr>` element for table rows.
///
/// The `<mtr>` element is used to represent a row in a MathML table (mtable).
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
/// - SeeAlso: W3C [mtr](https://www.w3.org/TR/MathML3/chapter3.html#presm.mtr) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MTr<Content>: View where Content: View {
  /// Creates an MTr element.
  ///
  /// - Parameter content: The table cells (MTd elements).
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("mtr")
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
}
