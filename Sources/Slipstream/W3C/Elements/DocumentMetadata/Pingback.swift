import Foundation

import SwiftSoup

/// The address of the pingback server for the current document.
///
/// The `Pingback` view renders a `<link rel="pingback">` element in HTML,
/// which specifies the server that handles pingbacks to the current document.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       Pingback(URL(string: "https://example.com/xmlrpc.php"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "pingback"](https://html.spec.whatwg.org/multipage/links.html#link-type-pingback)
@available(iOS 17.0, macOS 14.0, *)
public struct Pingback: View {
  /// Creates a pingback link.
  ///
  /// - Parameters:
  ///   - url: The URL of the pingback server, or nil.
  public init(_ url: URL?) {
    self.url = url
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "pingback")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
