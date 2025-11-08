import Foundation

import SwiftSoup

/// Indicates that an element with the target ID is expected to appear in the current document.
///
/// The `Expect` view renders a `<link rel="expect">` element in HTML, which signals to browsers
/// and performance monitoring tools that a specific element is expected to render on the page.
/// This is primarily used for performance optimization and content visibility monitoring.
///
/// ## When to Use
///
/// Use `Expect` when you want to:
/// - Signal to browsers which elements are critical for the initial page render
/// - Help performance monitoring tools track when important content becomes visible
/// - Indicate elements that should be prioritized during page loading
/// - Provide hints for Largest Contentful Paint (LCP) optimization
///
/// ## Example
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       // Tell the browser to expect and prioritize the main content area
///       Expect("#main-content")
///
///       // Indicate critical hero image for LCP tracking
///       Expect("#hero-image")
///     }
///   }
/// }
/// ```
///
/// ## Performance Considerations
///
/// The `Expect` link type helps browsers make better decisions about resource prioritization
/// and can improve Core Web Vitals metrics by signaling which elements are essential for
/// the user experience.
///
/// - SeeAlso: W3C Specification: [Link type "expect"](https://html.spec.whatwg.org/multipage/links.html#link-type-expect)
@available(iOS 17.0, macOS 14.0, *)
public struct Expect: View {
  /// Creates an expect link.
  ///
  /// - Parameters:
  ///   - href: The fragment identifier or URL of the expected element.
  public init(_ href: String?) {
    self.href = href
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let href else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "expect")
    try element.attr("href", href)
  }

  private let href: String?
}
