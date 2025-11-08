import SwiftSoup

/// A view that represents a MathML `<msubsup>` element for subscripts and superscripts.
///
/// The `<msubsup>` element is used to attach both a subscript and superscript to a base expression.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Math {
///         MSubSup {
///           MI("x")
///           MN("0")
///           MN("2")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [msubsup](https://www.w3.org/TR/MathML3/chapter3.html#presm.msubsup) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MSubSup<Content>: View where Content: View {
  /// Creates an MSubSup element.
  ///
  /// - Parameter content: The base, subscript, and superscript expressions (must contain exactly three children).
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("msubsup")
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
}
