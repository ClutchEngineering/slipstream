import Foundation

import SwiftSoup

/// A view that specifies the base URL to use for all relative URLs in a document.
///
/// The `Base` element allows authors to specify the document base URL for the
/// purposes of parsing URLs, and optionally a default browsing context for
/// following hyperlinks and submitting forms.
///
/// ```swift
/// struct MySiteMetadata: View {
///   var body: some View {
///     Head {
///       Base(url: URL(string: "https://example.com/path/"))
///       Title("My Site")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`base`](https://html.spec.whatwg.org/multipage/semantics.html#the-base-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Base: View {
  /// Creates a Base view.
  ///
  /// - Parameters:
  ///   - url: The base URL for relative URLs in the document.
  ///   - target: The default browsing context for hyperlinks and forms.
  public init(url: URL? = nil, target: String? = nil) {
    self.url = url
    self.target = target
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("base")

    if let url {
      try element.attr("href", url.absoluteString)
    }

    if let target {
      try element.attr("target", target)
    }
  }

  private let url: URL?
  private let target: String?
}
