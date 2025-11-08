import Foundation

import SwiftSoup

/// Indicates that the document's author does not endorse the referenced document.
///
/// The `Nofollow` view renders a `<link rel="nofollow">` element in HTML,
/// which signals that the link should not influence search engine rankings.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       Nofollow(URL(string: "https://untrusted-site.com"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "nofollow"](https://html.spec.whatwg.org/multipage/links.html#link-type-nofollow)
@available(iOS 17.0, macOS 14.0, *)
public struct Nofollow: View {
  /// Creates a nofollow link annotation.
  ///
  /// - Parameters:
  ///   - url: The URL to mark as nofollow, or nil.
  public init(_ url: URL?) {
    self.url = url
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "nofollow")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
