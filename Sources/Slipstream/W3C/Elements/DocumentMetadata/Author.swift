/// A link to the author of the current document or article.
///
/// The `Author` view renders a `<link rel="author">` element in HTML,
/// which provides a link to information about the author of the document.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       Author(URL(string: "/about"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "author"](https://html.spec.whatwg.org/multipage/links.html#link-type-author)
@available(iOS 17.0, macOS 14.0, *)
public struct Author: View {
  /// Creates an author link.
  ///
  /// - Parameters:
  ///   - url: The URL of the author information, or nil.
  public init(_ url: URL?) {
    self.url = url
  }

  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "author")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
