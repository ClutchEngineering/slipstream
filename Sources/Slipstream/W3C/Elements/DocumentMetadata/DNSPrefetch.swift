import Foundation

import SwiftSoup

/// A hint to preemptively perform DNS resolution for a target resource's origin.
///
/// The `DNSPrefetch` view renders a `<link rel="dns-prefetch">` element in HTML,
/// which instructs the browser to perform DNS resolution in advance for performance optimization.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       DNSPrefetch(URL(string: "https://example.com"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "dns-prefetch"](https://html.spec.whatwg.org/multipage/links.html#link-type-dns-prefetch)
@available(iOS 17.0, macOS 14.0, *)
public struct DNSPrefetch: View {
  /// Creates a DNS prefetch hint.
  ///
  /// - Parameters:
  ///   - url: The URL of the resource origin for DNS prefetching, or nil.
  public init(_ url: URL?) {
    self.url = url
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "dns-prefetch")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
