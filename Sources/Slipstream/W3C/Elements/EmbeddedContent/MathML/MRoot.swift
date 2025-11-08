import SwiftSoup

/// A view that represents a MathML `<mroot>` element for nth roots.
///
/// The `<mroot>` element is used to display the nth root of an expression.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Math {
///         MRoot {
///           MI("x")
///           MN("3")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [mroot](https://www.w3.org/TR/MathML3/chapter3.html#presm.mroot) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MRoot<Content>: View where Content: View {
  /// Creates an MRoot element.
  ///
  /// - Parameter content: The base and index expressions (must contain exactly two children).
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("mroot")
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
}
