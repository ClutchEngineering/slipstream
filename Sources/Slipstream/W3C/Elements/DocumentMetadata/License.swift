/// A link to the copyright license for the current document.
///
/// The `License` view renders a `<link rel="license">` element in HTML,
/// which indicates the license under which the main content is distributed.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       License(URL(string: "https://creativecommons.org/licenses/by/4.0/"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "license"](https://html.spec.whatwg.org/multipage/links.html#link-type-license)
@available(iOS 17.0, macOS 14.0, *)
public struct License: View {
  /// Creates a license link.
  ///
  /// - Parameters:
  ///   - url: The URL of the license, or nil.
  public init(_ url: URL?) {
    self.url = url
  }

  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "license")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
