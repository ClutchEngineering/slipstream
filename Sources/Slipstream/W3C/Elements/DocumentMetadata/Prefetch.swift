import Foundation

import SwiftSoup

/// Preemptively fetches and caches a resource for a followup navigation.
///
/// The `Prefetch` view renders a `<link rel="prefetch">` element in HTML,
/// which hints to the browser to fetch a resource that will likely be needed.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       Prefetch(URL(string: "/next-page.html"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "prefetch"](https://html.spec.whatwg.org/multipage/links.html#link-type-prefetch)
@available(iOS 17.0, macOS 14.0, *)
public struct Prefetch: View {
  /// Creates a prefetch hint.
  ///
  /// - Parameters:
  ///   - url: The URL of the resource to prefetch, or nil.
  ///   - crossOrigin: The CORS setting for the prefetch.
  public init(_ url: URL?, crossOrigin: CrossOrigin? = nil) {
    self.url = url
    self.crossOrigin = crossOrigin
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "prefetch")
    try element.attr("href", url.absoluteString)
    if let crossOrigin {
      try element.attr("crossorigin", crossOrigin.rawValue)
    }
  }

  private let url: URL?
  private let crossOrigin: CrossOrigin?
}
