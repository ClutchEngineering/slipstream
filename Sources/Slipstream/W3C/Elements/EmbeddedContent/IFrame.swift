import Foundation

import SwiftSoup

/// A view that represents embedded content.
///
/// - SeeAlso: W3C [iframe](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-iframe-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct IFrame: View {
  /// Creates an iframe view pointing to a URL.
  ///
  /// - Parameters:
  ///   - url: The content will be loaded from this URL.
  public init(_ url: URL?) {
    self.url = url
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else {
      return
    }
    let element = try container.appendElement("iframe")
    try element.attr("src", url.absoluteString)
  }

  private let url: URL?
}
