import SwiftSoup

/// A view that represents a MathML `<mtable>` element for tables.
///
/// The `<mtable>` element is used to create tables in mathematical expressions,
/// such as matrices, determinants, or systems of equations.
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
///           MTr {
///             MTd {
///               MN("3")
///             }
///             MTd {
///               MN("4")
///             }
///           }
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [mtable](https://www.w3.org/TR/MathML3/chapter3.html#presm.mtable) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MTable<Content>: View where Content: View {
  /// Creates an MTable element.
  ///
  /// - Parameter content: The table rows (MTr elements).
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("mtable")
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
}
