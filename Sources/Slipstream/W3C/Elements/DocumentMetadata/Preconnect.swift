import Foundation

import SwiftSoup

/// A view that indicates that preemptively initiating a connection to the
/// origin of the specified resource is likely to be beneficial, as it is highly
/// likely that the user will require resources located at that origin, and
/// the user experience would be improved by preempting the latency
/// costs associated with establishing the connection.
///
/// ```swift
/// struct MySiteMetadata: View {
///   var body: some View {
///     Head {
///       Preconnect(URL(string: "https://rsms.me/"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [link](https://html.spec.whatwg.org/multipage/semantics.html#the-link-element) specification.
/// - SeeAlso: W3C [preconnect](https://html.spec.whatwg.org/multipage/links.html#link-type-preconnect) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Preconnect: View {
  /// Creates a Preconnect view.
  public init(_ url: URL?) {
    self.url = url
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else {
      return
    }
    let element = try container.appendElement("link")
    try element.attr("rel", "preconnect")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
