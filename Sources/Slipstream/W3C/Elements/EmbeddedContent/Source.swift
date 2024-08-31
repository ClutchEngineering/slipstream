import Foundation

import SwiftSoup

/// A media query representation of the user's selected color scheme.
@available(iOS 17.0, macOS 14.0, *)
public enum ColorScheme {
  case light
  case dark
}

/// A view that allows authors to specify multiple alternative source sets for ``Image``
/// views or multiple alternative media resources for media elements.
///
/// ``Source`` does not represent anything on its own.
///
/// - SeeAlso: W3C [source](https://html.spec.whatwg.org/multipage/embedded-content.html#the-source-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Source: View {
  /// Creates a Source view.
  ///
  /// - Parameters:
  ///   - url: The image will be loaded from this URL when the browser is using the given color scheme.
  ///   - colorScheme: The color scheme for which this image should be loaded.
  public init(_ url: URL?, colorScheme: ColorScheme) {
    self.url = url
    self.colorScheme = colorScheme
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else {
      return
    }
    let element = try container.appendElement("source")
    try element.attr("srcset", url.absoluteString)
    switch colorScheme {
    case .light:
      try element.attr("media", "(prefers-color-scheme: light)")
    case .dark:
      try element.attr("media", "(prefers-color-scheme: dark)")
    }
  }

  private let url: URL?
  private let colorScheme: ColorScheme
}
