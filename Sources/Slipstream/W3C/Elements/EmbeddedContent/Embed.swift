import Foundation

import SwiftSoup

/// A view that represents an integration point for external content.
///
/// The Embed element is typically used to embed external applications or
/// interactive content such as plugins, multimedia content, or other
/// non-HTML resources.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Embed(URL(string: "/media/video.mp4"), type: "video/mp4")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`embed`](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-embed-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Embed: View {
  /// Creates an Embed view.
  ///
  /// - Parameters:
  ///   - url: The URL of the resource being embedded.
  ///   - type: The MIME type of the embedded content. This can help the browser
  ///     determine how to display the content.
  public init(_ url: URL?, type: String? = nil) {
    self.url = url
    self.type = type
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else {
      return
    }
    let element = try container.appendElement("embed")
    try element.attr("src", url.absoluteString)
    if let type {
      try element.attr("type", type)
    }
  }

  private let url: URL?
  private let type: String?
}
