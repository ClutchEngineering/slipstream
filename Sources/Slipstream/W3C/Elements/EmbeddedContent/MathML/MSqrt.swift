import SwiftSoup

/// A view that represents a MathML `<msqrt>` element for square roots.
///
/// The `<msqrt>` element is used to display the square root of an expression.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Math {
///         MSqrt {
///           MI("x")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [msqrt](https://www.w3.org/TR/MathML3/chapter3.html#presm.msqrt) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MSqrt<Content>: View where Content: View {
  /// Creates an MSqrt element.
  ///
  /// - Parameter content: The expression to take the square root of.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("msqrt")
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
}
