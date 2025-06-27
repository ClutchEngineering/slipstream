import Foundation

import SwiftSoup

/// A container that provides multiple sources to its contained ``Image`` view.
///
/// Picture allow authors to declaratively control or give hints to the user agent about which
/// image resource to use, based on the screen pixel density, viewport size, image format,
/// and other factors
///
/// - SeeAlso: W3C [picture](https://html.spec.whatwg.org/multipage/embedded-content.html#the-picture-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Picture<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "picture"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Picture view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
