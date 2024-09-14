import Foundation

import SwiftSoup

/// A view that is an icon representing the page or site/.
///
/// ```swift
/// struct MySiteMetadata: View {
///   var body: some View {
///     Head {
///       Icon(URL(string: "/favicon.ico"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [rel="icon"](https://html.spec.whatwg.org/multipage/links.html#rel-icon) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Icon: View {
  /// Creates an Icon view.
  ///
  /// - Parameters:
  ///   - url: The icon will be loaded from this URL.
  ///   - sizes: Gives the sizes of icons for visual media. If present, is only advisory.
  ///   - type: The MIME type of the linked resource. If present, is only advisory and must be a valid MIME type.
  public init(_ url: URL?, sizes: String? = nil, type: String? = nil) {
    self.url = url
    self.sizes = sizes
    self.type = type
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else {
      return
    }
    let element = try container.appendElement("link")
    try element.attr("rel", "icon")
    try element.attr("href", url.absoluteString)
    if let sizes {
      try element.attr("sizes", sizes)
    }
    if let type {
      try element.attr("type", type)
    }
  }

  private let url: URL?
  private let sizes: String?
  private let type: String?
}
