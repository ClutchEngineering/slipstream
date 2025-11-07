import SwiftSoup

/// A view that represents a MathML `<munderover>` element for underscripts and overscripts.
///
/// The `<munderover>` element is used to attach both an underscript and overscript to a base expression,
/// commonly used for summations, integrals, and limits.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Math {
///         MUnderOver {
///           MO("∑")
///           MRow {
///             MI("i")
///             MO("=")
///             MN("1")
///           }
///           MI("n")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [munderover](https://www.w3.org/TR/MathML3/chapter3.html#presm.munderover) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MUnderOver<Content>: View where Content: View {
  /// Creates an MUnderOver element.
  ///
  /// - Parameter content: The base, underscript, and overscript expressions (must contain exactly three children).
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("munderover")
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
}
