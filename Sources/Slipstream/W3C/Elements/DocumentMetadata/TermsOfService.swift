import Foundation

import SwiftSoup

/// A link to the terms of service for the current document.
///
/// The `TermsOfService` view renders a `<link rel="terms-of-service">` element in HTML,
/// which provides information about usage agreements.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       TermsOfService(URL(string: "/terms"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "terms-of-service"](https://html.spec.whatwg.org/multipage/links.html#link-type-terms-of-service)
@available(iOS 17.0, macOS 14.0, *)
public struct TermsOfService: View {
  /// Creates a terms of service link.
  ///
  /// - Parameters:
  ///   - url: The URL of the terms of service, or nil.
  public init(_ url: URL?) {
    self.url = url
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "terms-of-service")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
