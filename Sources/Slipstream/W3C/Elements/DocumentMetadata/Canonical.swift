import Foundation

import SwiftSoup

/// A view that indicates that a URL is the preferred URL for the current document.
///
/// ```swift
/// struct MySiteMetadata: View {
///   var body: some View {
///     Head {
///       Canonical(URL(string: "https://mysite.com"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [rel="canonical"](https://html.spec.whatwg.org/multipage/links.html#link-type-canonical) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Canonical: View {
  /// Creates a Canonical view.
  ///
  /// - Parameters:
  ///   - url: The preferred URL for this document.
  public init(_ url: URL?) {
    self.url = url
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else {
      return
    }
    let element = try container.appendElement("link")
    try element.attr("rel", "canonical")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
