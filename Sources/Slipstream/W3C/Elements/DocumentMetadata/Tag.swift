/// A tag that applies to the current document.
///
/// The `Tag` view renders a `<link rel="tag">` element in HTML,
/// which indicates a tag or category for the current document.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       Tag(URL(string: "/tags/swift"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "tag"](https://html.spec.whatwg.org/multipage/links.html#link-type-tag)
@available(iOS 17.0, macOS 14.0, *)
public struct Tag: View {
  /// Creates a tag link.
  ///
  /// - Parameters:
  ///   - url: The URL of the tag, or nil.
  public init(_ url: URL?) {
    self.url = url
  }

  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "tag")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
