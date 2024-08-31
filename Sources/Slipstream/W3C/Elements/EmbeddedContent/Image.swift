import Foundation

import SwiftSoup

/// A view that displays an image.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Image(URL(string: "/logo.png"))
///         .accessibilityLabel("My awesome site logo")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`img`](https://html.spec.whatwg.org/multipage/embedded-content.html#the-img-element) specification.
/// - SeeAlso: W3C [requirements for providing text to act as an alternative for images](https://html.spec.whatwg.org/multipage/images.html#alt).
///
/// ## See Also
///
/// - ``View/accessibilityLabel(_:)``
@available(iOS 17.0, macOS 14.0, *)
public struct Image: View {
  /// Creates an Image view.
  ///
  /// - Parameters:
  ///   - url: The image will be loaded from this URL.
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
    let element = try container.appendElement("img")
    try element.attr("src", url.absoluteString)
    if let crossOrigin {
      try element.attr("crossorigin", crossOrigin.rawValue)
    }
  }

  private let url: URL?
  private let crossOrigin: CrossOrigin?
}
