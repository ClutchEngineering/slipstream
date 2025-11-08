import Foundation

import SwiftSoup

/// Prevents a hyperlink from accessing the window.opener property.
///
/// The `NoOpener` view renders a `<link rel="noopener">` element in HTML,
/// which creates a browsing context without access to the opening window.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       NoOpener(URL(string: "https://external-site.com"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "noopener"](https://html.spec.whatwg.org/multipage/links.html#link-type-noopener)
@available(iOS 17.0, macOS 14.0, *)
public struct NoOpener: View {
  /// Creates a noopener link annotation.
  ///
  /// - Parameters:
  ///   - url: The URL to open without opener access, or nil.
  public init(_ url: URL?) {
    self.url = url
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "noopener")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
