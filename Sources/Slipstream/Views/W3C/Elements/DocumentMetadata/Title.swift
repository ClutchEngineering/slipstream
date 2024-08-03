import SwiftSoup

/// A view that represents the document’s title or name.
///
/// The content of this element sets the title displayed in the browser's title bar or tab, and
/// is also used by search engines to identify the content of the page. A well-chosen title
/// improves user experience and can significantly impact search engine optimization (SEO).
///
/// ```swift
/// struct MySiteMetadata: View {
///   var body: some View {
///     Head {
///       Title("My awesome site")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`title`](https://html.spec.whatwg.org/multipage/semantics.html#the-title-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Title: View {
  /// Creates a Title view.
  public init(_ text: String) {
    self.text = text
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("title")
    try element.appendText(text)
  }

  private let text: String
}
