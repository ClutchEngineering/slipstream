/// Creates an auxiliary browsing context for "_blank" target links.
///
/// The `Opener` view renders a `<link rel="opener">` element in HTML,
/// which allows the opened window to access the opener property.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       Opener(URL(string: "https://example.com"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "opener"](https://html.spec.whatwg.org/multipage/links.html#link-type-opener)
@available(iOS 17.0, macOS 14.0, *)
public struct Opener: View {
  /// Creates an opener link annotation.
  ///
  /// - Parameters:
  ///   - url: The URL to open with opener access, or nil.
  public init(_ url: URL?) {
    self.url = url
  }

  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "opener")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
