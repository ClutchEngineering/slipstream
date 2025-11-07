/// Indicates that the referenced document is not part of the same site.
///
/// The `External` view renders a `<link rel="external">` element in HTML,
/// which indicates that the link points to an external resource.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       External(URL(string: "https://example.com"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "external"](https://html.spec.whatwg.org/multipage/links.html#link-type-external)
@available(iOS 17.0, macOS 14.0, *)
public struct External: View {
  /// Creates an external link annotation.
  ///
  /// - Parameters:
  ///   - url: The URL of the external resource, or nil.
  public init(_ url: URL?) {
    self.url = url
  }

  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "external")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
