import SwiftSoup

/// A view that represents a MathML `<mrow>` element for grouping expressions.
///
/// The `<mrow>` element is used to group together any number of sub-expressions,
/// typically to apply a common formatting or to indicate that they form a single expression.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Math {
///         MRow {
///           MI("x")
///           MO("+")
///           MI("y")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [mrow](https://www.w3.org/TR/MathML3/chapter3.html#presm.mrow) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MRow<Content>: View where Content: View {
  /// Creates an MRow element.
  ///
  /// - Parameter content: The mathematical expressions to group together.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("mrow")
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
}
