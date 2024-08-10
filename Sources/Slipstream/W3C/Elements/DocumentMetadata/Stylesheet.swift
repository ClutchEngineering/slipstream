import Foundation

import SwiftSoup

/// A view that causes a stylesheet to be imported when the page is loaded
///
/// ```swift
/// struct MySiteMetadata: View {
///   var body: some View {
///     Head {
///       Stylesheet("My awesome site")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`link`](https://html.spec.whatwg.org/multipage/semantics.html#the-link-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Stylesheet: View {
  /// Creates a Stylesheet view.
  ///
  /// - Parameters:
  ///   - url: The stylesheet will be loaded from this URL.
  ///   - crossOrigin: If provided, configures the Cross-Origin Resource Sharing (CORS)
  ///   behavior for the request of this resource. If not provided, then the No CORS state is
  ///   implied.
  public init(_ url: URL?, crossOrigin: CrossOrigin? = nil) {
    self.url = url
    self.crossOrigin = crossOrigin
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else {
      return
    }
    let element = try container.appendElement("link")
    try element.attr("rel", "stylesheet")
    try element.attr("href", url.absoluteString)
    if let crossOrigin {
      try element.attr("crossorigin", crossOrigin.rawValue)
    }
  }

  private let url: URL?
  private let crossOrigin: CrossOrigin?
}
