import Foundation

import SwiftSoup

/// Prevents the Referer header from being sent and implies noopener.
///
/// The `NoReferrer` view renders a `<link rel="noreferrer">` element in HTML,
/// which prevents the referrer information from being passed to the target.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       NoReferrer(URL(string: "https://external-site.com"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "noreferrer"](https://html.spec.whatwg.org/multipage/links.html#link-type-noreferrer)
@available(iOS 17.0, macOS 14.0, *)
public struct NoReferrer: View {
  /// Creates a noreferrer link annotation.
  ///
  /// - Parameters:
  ///   - url: The URL to open without referrer information, or nil.
  public init(_ url: URL?) {
    self.url = url
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "noreferrer")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
