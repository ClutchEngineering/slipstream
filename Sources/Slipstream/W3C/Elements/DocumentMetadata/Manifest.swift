import Foundation

import SwiftSoup

/// Imports or links to an application manifest.
///
/// The `Manifest` view renders a `<link rel="manifest">` element in HTML,
/// which specifies a web application manifest file.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       Manifest(URL(string: "/manifest.json"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "manifest"](https://html.spec.whatwg.org/multipage/links.html#link-type-manifest)
@available(iOS 17.0, macOS 14.0, *)
public struct Manifest: View {
  /// Creates a manifest link.
  ///
  /// - Parameters:
  ///   - url: The URL of the manifest file, or nil.
  ///   - crossOrigin: The CORS setting for the manifest.
  public init(_ url: URL?, crossOrigin: CrossOrigin? = nil) {
    self.url = url
    self.crossOrigin = crossOrigin
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "manifest")
    try element.attr("href", url.absoluteString)
    if let crossOrigin {
      try element.attr("crossorigin", crossOrigin.rawValue)
    }
  }

  private let url: URL?
  private let crossOrigin: CrossOrigin?
}
