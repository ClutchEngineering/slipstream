import Foundation

import SwiftSoup

/// A view that causes a page to redirect to another URL after a delay.
///
/// - SeeAlso: W3C [http-equiv refresh](https://html.spec.whatwg.org/multipage/semantics.html#attr-meta-http-equiv-refresh) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Redirect: View {
  /// Creates a Redirect view.
  public init(_ url: URL?, delay: TimeInterval = 0) {
    self.url = url
    self.delay = delay
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else {
      return
    }
    let element = try container.appendElement("meta")
    try element.attr("http-equiv", "refresh")
    try element.attr("content", "\(delay); url='\(url.absoluteString)'")
  }

  private let url: URL?
  private let delay: TimeInterval
}
