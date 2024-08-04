import Foundation

import SwiftSoup

/// A view that represents a hyperlink to a URL.
///
/// ```swift
/// struct MySiteMetadata: View {
///   var body: some View {
///     Head {
///       Link("About", destination: URL(string: "/about"))
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`a`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-a-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Link<Content>: View where Content: View {
  /// Creates a hyperlink view with content.
  ///
  /// - Parameters:
  ///   - openInNewTab: If true, clicking the link will cause a new tab to be opened.
  public init(_ destination: URL?, openInNewTab: Bool = false, @ViewBuilder content: @escaping () -> Content) {
    self.destination = destination
    self.openInNewTab = openInNewTab
    self.content = content
  }

  /// Creates a hyperlink view with ``Text`` content.
  ///
  /// - Parameters:
  ///   - openInNewTab: If true, clicking the link will cause a new tab to be opened.
  public init(_ string: String, destination: URL?, openInNewTab: Bool = false) where Content == Text {
    self.destination = destination
    self.openInNewTab = openInNewTab
    self.content = {
      Text(string)
    }
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("a")
    if let destination {
      try element.attr("href", destination.absoluteString)
    }
    if openInNewTab {
      try element.attr("target", "_blank")
    }
    try content().render(element, environment: environment)
  }

  private let destination: URL?
  private let openInNewTab: Bool
  private let content: () -> Content
}
