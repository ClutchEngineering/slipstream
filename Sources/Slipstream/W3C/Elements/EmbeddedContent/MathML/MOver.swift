import SwiftSoup

/// A view that represents a MathML `<mover>` element for overscripts.
///
/// The `<mover>` element is used to attach an overscript to a base expression,
/// commonly used for accents, limits, and other notations.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Math {
///         MOver {
///           MI("x")
///           MO("^")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [mover](https://www.w3.org/TR/MathML3/chapter3.html#presm.mover) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MOver<Content>: View where Content: View {
  /// Creates an MOver element.
  ///
  /// - Parameter content: The base and overscript expressions (must contain exactly two children).
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("mover")
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
}
