import Foundation

import SwiftSoup

/// A link to the next document in a series.
///
/// The `Next` view renders a `<link rel="next">` element in HTML,
/// which indicates the next document in a sequence (e.g., pagination).
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       Next(URL(string: "/page2"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "next"](https://html.spec.whatwg.org/multipage/links.html#link-type-next)
@available(iOS 17.0, macOS 14.0, *)
public struct Next: View {
  /// Creates a next link.
  ///
  /// - Parameters:
  ///   - url: The URL of the next document, or nil.
  public init(_ url: URL?) {
    self.url = url
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "next")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
