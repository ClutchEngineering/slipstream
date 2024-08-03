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
  public init(_ url: URL?) {
    self.url = url
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else {
      return
    }
    let element = try container.appendElement("link")
    try element.attr("rel", "stylesheet")
    try element.attr("href", url.absoluteString)
  }

  private let url: URL?
}
