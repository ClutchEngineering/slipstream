import Foundation

import SwiftSoup

/// The type of content a ``Preload`` url points to.
///
/// - SeeAlso: W3C [request destination](https://fetch.spec.whatwg.org/#concept-request-destination) specification.
@available(iOS 17.0, macOS 14.0, *)
public enum RequestDestination: String, Sendable {
  case audio
  case audioWorklet = "audioworklet"
  case document
  case embed
  case font
  case frame
  case iframe
  case image
  case json
  case manifest
  case object
  case paintWorklet = "paintworklet"
  case report
  case script
  case serviceWorker = "serviceworker"
  case sharedWorker = "sharedworker"
  case style
  case track
  case video
  case webIdentity = "webidentity"
  case worker
  case xslt
}

/// A view that causes a resource to be preemptively retrieved
/// while the page is being loaded.
///
/// ```swift
/// struct MySiteMetadata: View {
///   var body: some View {
///     Head {
///       Preload(URL(string: "/logo.svg"), as: .image)
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`link`](https://html.spec.whatwg.org/multipage/semantics.html#the-link-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Preload: View {
  /// Creates a Preload view.
  public init(_ url: URL?, as destination: RequestDestination) {
    self.url = url
    self.destination = destination
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else {
      return
    }
    let element = try container.appendElement("link")
    try element.attr("rel", "preload")
    try element.attr("as", destination.rawValue)
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
  private let destination: RequestDestination
}
