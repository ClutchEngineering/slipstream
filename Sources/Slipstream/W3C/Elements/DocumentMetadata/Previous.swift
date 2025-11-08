import Foundation

import SwiftSoup

/// A link to the previous document in a series.
///
/// The `Previous` view renders a `<link rel="prev">` element in HTML,
/// which indicates the previous document in a sequence (e.g., pagination).
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       Previous(URL(string: "/page1"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "prev"](https://html.spec.whatwg.org/multipage/links.html#link-type-prev)
@available(iOS 17.0, macOS 14.0, *)
public struct Previous: View {
  /// Creates a previous link.
  ///
  /// - Parameters:
  ///   - url: The URL of the previous document, or nil.
  public init(_ url: URL?) {
    self.url = url
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "prev")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
