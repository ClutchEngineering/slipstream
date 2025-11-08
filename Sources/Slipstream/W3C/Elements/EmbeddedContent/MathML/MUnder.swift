import SwiftSoup

/// A view that represents a MathML `<munder>` element for underscripts.
///
/// The `<munder>` element is used to attach an underscript to a base expression,
/// commonly used for limits and other notations.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Math {
///         MUnder {
///           MO("lim")
///           MRow {
///             MI("x")
///             MO("→")
///             MN("0")
///           }
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [munder](https://www.w3.org/TR/MathML3/chapter3.html#presm.munder) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MUnder<Content>: View where Content: View {
  /// Creates an MUnder element.
  ///
  /// - Parameter content: The base and underscript expressions (must contain exactly two children).
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("munder")
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
}
