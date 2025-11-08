import Foundation

import SwiftSoup

/// A link to the privacy policy for the current document.
///
/// The `PrivacyPolicy` view renders a `<link rel="privacy-policy">` element in HTML,
/// which provides information about data collection and usage practices.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       PrivacyPolicy(URL(string: "/privacy"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "privacy-policy"](https://html.spec.whatwg.org/multipage/links.html#link-type-privacy-policy)
@available(iOS 17.0, macOS 14.0, *)
public struct PrivacyPolicy: View {
  /// Creates a privacy policy link.
  ///
  /// - Parameters:
  ///   - url: The URL of the privacy policy, or nil.
  public init(_ url: URL?) {
    self.url = url
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "privacy-policy")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
