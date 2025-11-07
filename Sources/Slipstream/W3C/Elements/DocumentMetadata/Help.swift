/// A link to context-sensitive help.
///
/// The `Help` view renders a `<link rel="help">` element in HTML,
/// which provides a link to help documentation relevant to the current page.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       Help(URL(string: "/help"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "help"](https://html.spec.whatwg.org/multipage/links.html#link-type-help)
@available(iOS 17.0, macOS 14.0, *)
public struct Help: View {
  /// Creates a help link.
  ///
  /// - Parameters:
  ///   - url: The URL of the help resource, or nil.
  public init(_ url: URL?) {
    self.url = url
  }

  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "help")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
