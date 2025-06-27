import Foundation

import SwiftSoup

/// A view that provides scripts with a resolution-dependent bitmap canvas,
/// which can be used for rendering graphs, game graphics, art, or other
/// visual images on the fly.
///
/// - SeeAlso: W3C [canvas](https://html.spec.whatwg.org/multipage/canvas.html#the-canvas-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Canvas<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "canvas"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Canvas view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
