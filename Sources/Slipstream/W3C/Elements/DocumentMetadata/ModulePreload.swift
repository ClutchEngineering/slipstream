/// Preemptively fetches a module script and stores it in the document's module map.
///
/// The `ModulePreload` view renders a `<link rel="modulepreload">` element in HTML,
/// which instructs the browser to fetch and cache a JavaScript module for later evaluation.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       ModulePreload(URL(string: "/js/app.mjs"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "modulepreload"](https://html.spec.whatwg.org/multipage/links.html#link-type-modulepreload)
@available(iOS 17.0, macOS 14.0, *)
public struct ModulePreload: View {
  /// Creates a module preload hint.
  ///
  /// - Parameters:
  ///   - url: The URL of the module to preload, or nil.
  ///   - crossOrigin: The CORS setting for the module.
  public init(_ url: URL?, crossOrigin: CrossOrigin? = nil) {
    self.url = url
    self.crossOrigin = crossOrigin
  }

  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "modulepreload")
    try element.attr("href", url.absoluteString)
    if let crossOrigin {
      try element.attr("crossorigin", crossOrigin.rawValue)
    }
  }

  private let url: URL?
  private let crossOrigin: CrossOrigin?
}
