import SwiftSoup

/// A view that represents a MathML `<msub>` element for subscripts.
///
/// The `<msub>` element is used to attach a subscript to a base expression.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Math {
///         MSub {
///           MI("x")
///           MN("0")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [msub](https://www.w3.org/TR/MathML3/chapter3.html#presm.msub) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MSub<Content>: View where Content: View {
  /// Creates an MSub element.
  ///
  /// - Parameter content: The base and subscript expressions (must contain exactly two children).
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("msub")
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
}
