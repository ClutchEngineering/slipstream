import Foundation

import SwiftSoup

/// A link to a search resource for the current document and related pages.
///
/// The `SearchLink` view renders a `<link rel="search">` element in HTML,
/// which provides a link to a search interface.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       SearchLink(URL(string: "/search"), type: "application/opensearchdescription+xml")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "search"](https://html.spec.whatwg.org/multipage/links.html#link-type-search)
@available(iOS 17.0, macOS 14.0, *)
public struct SearchLink: View {
  /// Creates a search link.
  ///
  /// - Parameters:
  ///   - url: The URL of the search resource, or nil.
  ///   - type: The MIME type of the search resource.
  public init(_ url: URL?, type: String? = nil) {
    self.url = url
    self.type = type
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "search")
    try element.attr("href", url.absoluteString)
    if let type {
      try element.attr("type", type)
    }
  }

  private let url: URL?
  private let type: String?
}
