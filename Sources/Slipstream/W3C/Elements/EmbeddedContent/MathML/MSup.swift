import SwiftSoup

/// A view that represents a MathML `<msup>` element for superscripts.
///
/// The `<msup>` element is used to attach a superscript to a base expression.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Math {
///         MSup {
///           MI("x")
///           MN("2")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [msup](https://www.w3.org/TR/MathML3/chapter3.html#presm.msup) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MSup<Content>: View where Content: View {
  /// Creates an MSup element.
  ///
  /// - Parameter content: The base and superscript expressions (must contain exactly two children).
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("msup")
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
}
