import Foundation

import SwiftSoup

/// A permalink for the nearest ancestor section.
///
/// The `Bookmark` view renders a `<link rel="bookmark">` element in HTML,
/// which provides a permanent link to a section of the document.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       Bookmark(URL(string: "/article#section1"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "bookmark"](https://html.spec.whatwg.org/multipage/links.html#link-type-bookmark)
@available(iOS 17.0, macOS 14.0, *)
public struct Bookmark: View {
  /// Creates a bookmark link.
  ///
  /// - Parameters:
  ///   - url: The URL of the bookmark, or nil.
  public init(_ url: URL?) {
    self.url = url
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "bookmark")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
