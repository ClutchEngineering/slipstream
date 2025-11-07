/// A link to an alternate representation of the current document.
///
/// The `Alternate` view renders a `<link rel="alternate">` element in HTML,
/// which provides alternate versions of the current document (e.g., translations,
/// different formats like PDF or RSS feeds).
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       Alternate(URL(string: "/feed.xml"), type: "application/rss+xml")
///       Alternate(URL(string: "/es/"), hreflang: "es")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "alternate"](https://html.spec.whatwg.org/multipage/links.html#rel-alternate)
@available(iOS 17.0, macOS 14.0, *)
public struct Alternate: View {
  /// Creates an alternate link.
  ///
  /// - Parameters:
  ///   - url: The URL of the alternate representation, or nil.
  ///   - type: The MIME type of the alternate representation.
  ///   - hreflang: The language of the alternate representation.
  ///   - title: The title of the alternate representation.
  public init(_ url: URL?, type: String? = nil, hreflang: String? = nil, title: String? = nil) {
    self.url = url
    self.type = type
    self.hreflang = hreflang
    self.title = title
  }

  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "alternate")
    try element.attr("href", url.absoluteString)
    if let type {
      try element.attr("type", type)
    }
    if let hreflang {
      try element.attr("hreflang", hreflang)
    }
    if let title {
      try element.attr("title", title)
    }
  }

  private let url: URL?
  private let type: String?
  private let hreflang: String?
  private let title: String?
}
