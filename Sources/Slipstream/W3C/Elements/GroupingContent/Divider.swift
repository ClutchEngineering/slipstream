import SwiftSoup

/// A divider represents a paragraph-level thematic break, e.g., a
/// scene change in a story, or a transition to another topic within
/// a section of a reference book.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Div {
///         Paragraph("Hello, world!")
///         Divider()
///         Paragraph("Let's make a website!")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`hr`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-hr-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Divider: View {
  /// Creates a divider view.
  public init() {
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    _ = try container.appendElement("hr")
  }
}
